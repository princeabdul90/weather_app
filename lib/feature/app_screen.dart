/*
* Developer: Abubakar Abdullahi
* Date: 2/1/2024
*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain_model/domain_model.dart';
import 'package:weather/repository/weather_repository.dart';

import 'bloc/weather_forecast_bloc.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastBloc(
        weatherRepository: context.read<WeatherRepository>(),
      )..add(const SearchCityForecastEvent(city: "cebu")),
      child: Scaffold(
        body: Center(
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              WeatherCard(
                imageString: 'asset/burj-khalifah.jpg',
              ),
              WeatherCard(
                imageString: 'asset/great-wall-of-china.jpg',
              ),
              WeatherCard(
                imageString: 'asset/statue-of-liberty.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.imageString,
  });

  final String imageString;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<WeatherForecastBloc, WeatherForecastState>(
      listener: (context, state) {

        if(state.status == Status.loading){
          const CircularProgressIndicator(color: Colors.white,);
        }
      },
      builder: (context, state) {
        return Container(
          constraints: BoxConstraints.expand(
            width: size.width,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageString), fit: BoxFit.cover)),
          child: Stack(
            children: [
              Container(
                decoration:
                    BoxDecoration(color: Colors.black.withOpacity(0.45)),
              ),
              if(state.status == Status.success)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildLocation(),

                  buildDate(day1: state.day1),

                  buildCurrentWeatherTemp(data: state.day1),

                  buildOtherWeatherConditions(data: state.day1),

                  buildOtherDaysWeather(day2: state.day2, day3: state.day3, day4: state.day4, day5: state.day5)
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget buildLocation() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.white,
              ),
              Text(
                'Dubai',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildDate({WeatherList? day1}) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DateFormat('EEEE d').format(day1!.dtTxt!),
          style: const TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
        ),
        Text(
          'Updated ${DateFormat.yMd().add_jm().format(day1.dtTxt!)}',
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ],
    );
  }

  Widget buildCurrentWeatherTemp({WeatherList? data}) {
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
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),
        ),
         Text(
          '${data.main!.temp} ℃',
          style: const TextStyle(
              color: Colors.white, fontSize: 48, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }

  Widget buildOtherWeatherConditions({WeatherList? data}) {
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
            reading: '${data != null ? data.main!.feelsLike : '0'}°'),
      ],
    );
  }

  Widget buildOtherDaysWeather({WeatherList? day2, WeatherList? day3, WeatherList? day4, WeatherList? day5}) {
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
                temp: '${day2.main!.temp}°',
                wind: '${day2.wind!.speed}',
            ),
            buildDayWeatherInfo(
              date: DateFormat('EEE, d').format(day3!.dtTxt!),
                icon: day3.weather!.first.icon,
              temp: '${day3.main!.temp}°',
              wind: '${day3.wind!.speed}',
            ),
            buildDayWeatherInfo(
              date: DateFormat('EEE, d').format(day4!.dtTxt!),
                icon: day4.weather!.first.icon,
              temp: '${day4.main!.temp}°',
              wind: '${day4.wind!.speed}',
            ),
            buildDayWeatherInfo(
              date: DateFormat('EEE, d').format(day5!.dtTxt!),
                icon: day5.weather!.first.icon,
              temp: '${day5.main!.temp}°',
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
