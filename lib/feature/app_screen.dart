/*
* Developer: Abubakar Abdullahi
* Date: 2/1/2024
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:weather/feature/widgets/loading_overlay.dart';
import 'package:weather/models/models.dart';
import 'package:weather/repository/weather_repository.dart';

import 'bloc/weather_forecast_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(DeviceCityForecastEvent()),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF391A49),
                  Color(0xFF301D5C),
                  Color(0xFF262171),
                  Color(0xFF301D5C),
                  Color(0xFF391A49),
                ],
              ),
          ),
          child: WeatherCard(),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
   WeatherCard({
    super.key,
  });



  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<WeatherForecastBloc, WeatherForecastState>(
      listener: (context, state) {
        if(state.status == Status.loading){
          _loadingOverlay.show(context);
        }else{
          _loadingOverlay.hide();
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            if(state.status == Status.success)
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  height: 60,
                  child: const SearchCity(),
                ),

                buildLocation(context, cityName: state.cityName),

                buildDate(day1: state.day1),

                buildCurrentWeatherTemp(data: state.day1),

                buildOtherWeatherConditions(data: state.day1),

                buildOtherDaysWeather(day2: state.day2, day3: state.day3, day4: state.day4, day5: state.day5)
              ],
            )
          ],
        );
      },
    );
  }

  Widget buildLocation(BuildContext context, {String? cityName}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
            children: [
              const Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              Text('$cityName',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto'),
              )
            ],
          ),

          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => const SavedLocationsScreen(),
          //       ),
          //     );
          //   },
          //   child: const Icon(
          //     Icons.menu,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget buildDate({WeatherListRM? day1}) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('EEEE d').format(day1!.dtTxt!),
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto'),
        ),
        Text(
          'Updated ${DateFormat.yMd().add_jm().format(day1.dtTxt!)}',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  Widget buildCurrentWeatherTemp({WeatherListRM? data}) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
            "https://openweathermap.org/img/wn/${data!.weather!.first.icon}@2x.png",
          width: 100,
        ),

        Text(
          '${data.weather!.first.description}',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto'),
        ),

        Text(
          '${data.main!.temp!.toStringAsFixed(2)} ℃',
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 64,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  Widget buildOtherWeatherConditions({WeatherListRM? data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildWeatherCondition(
            icon: Icons.water_drop_outlined, title: 'HUMIDITY', reading: '${data != null ? data.main!.humidity : '0'}%'),
        buildWeatherCondition(
            icon: Icons.air_rounded, title: 'WIND', reading: '${data != null ? data.wind!.speed : '0'}km/h'),
        buildWeatherCondition(
            icon: Icons.thermostat_outlined,
            title: 'FEELS LIKE',
            reading: '${data != null ? data.main!.feelsLike!.toStringAsFixed(0) : '0'}°'),
      ],
    );
  }

  Widget buildOtherDaysWeather({WeatherListRM? day2, WeatherListRM? day3, WeatherListRM? day4, WeatherListRM? day5}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.black.withOpacity(0.4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildDayWeatherInfo(
                date: DateFormat('EEE, d').format(day2!.dtTxt!),
                icon: day2.weather!.first.icon,
                temp: '${day2.main!.temp!.toStringAsFixed(0)}°',
                wind: '${day2.wind!.speed}',
            ),
            buildDayWeatherInfo(
              date: DateFormat('EEE, d').format(day3!.dtTxt!),
                icon: day3.weather!.first.icon,
              temp: '${day3.main!.temp!.toStringAsFixed(0)}°',
              wind: '${day3.wind!.speed}',
            ),
            buildDayWeatherInfo(
              date: DateFormat('EEE, d').format(day4!.dtTxt!),
                icon: day4.weather!.first.icon,
              temp: '${day4.main!.temp!.toStringAsFixed(0)}°',
              wind: '${day4.wind!.speed}',
            ),
            buildDayWeatherInfo(
              date: DateFormat('EEE, d').format(day5!.dtTxt!),
                icon: day5.weather!.first.icon,
              temp: '${day5.main!.temp!.toStringAsFixed(0)}°',
              wind: '${day5.wind!.speed}',
            )
          ],
        ),
      ),
    );
  }

  Widget buildWeatherCondition(
      {IconData? icon, String? title, String? reading}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 45,
        ),
        Text(
          title!,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
        Text(
          reading!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ],
    );
  }

  Widget buildDayWeatherInfo(
      {String? icon, String? date, String? temp, String? wind}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          date!,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        const Gap(10),
        Image.network(
          "https://openweathermap.org/img/wn/$icon@2x.png",
          width: 50,
        ),
        const Gap(5),
        Text(
          temp!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        const Gap(10),
        Column(
          children: [
            Text(
              wind!,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
            const Text(
              'km/h',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ],
    );
  }
}

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final TextEditingController searchController = TextEditingController();

  void onSearch(){
    if(searchController.text.length > 2){
      context.read<WeatherForecastBloc>().add(SearchCityForecastEvent(city: searchController.text));
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.8,
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Enter City Name',
              hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  //fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins'),
            ),
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                //fontWeight: FontWeight.w400,
                fontFamily: 'Poppins'),
          ),
        ),
        InkWell(
          onTap: () => onSearch(),
          child: const Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}