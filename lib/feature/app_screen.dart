/*
* Developer: Abubakar Abdullahi
* Date: 2/1/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Center(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            WeatherCard(imageString: 'asset/burj-khalifah.jpg',),
            WeatherCard(imageString: 'asset/great-wall-of-china.jpg',),
            WeatherCard(imageString: 'asset/statue-of-liberty.jpg',),
          ]
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

    return Container(
      constraints: BoxConstraints.expand(width: size.width,),
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageString),
              fit: BoxFit.cover
          )
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45)
            ),
          ),
          
          Column(
            children: [
              const Gap(45),
              buildLocation(),

              const Gap(40),
              buildDate(),

              const Gap(40),
              buildCurrentWeatherTemp(),

              const Gap(40),
              buildOtherWeatherConditions(),

              const Gap(20),
              buildOtherDaysWeather()
            ],
          )
        ],
      ),
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
              Icon(Icons.location_pin, color: Colors.white,),
              Text('Dubai', style: TextStyle(color: Colors.white),)
            ],
          ),
          Icon(Icons.menu, color: Colors.white,),
        ],
      ),
    );
  }

  Widget buildDate() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('February 02', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),),
        Text('Updated 02/02/2024  10:54AM', style: TextStyle(color: Colors.white, fontSize: 10),),

      ],
    );
  }

  Widget buildCurrentWeatherTemp() {
    return  const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.sunny, color: Colors.white,),
        Text('Clear', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),),
        Text('40 ℃', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.w700   ),),
      ],
    );
  }

  Widget buildOtherWeatherConditions(){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildWeatherCondition(icon: Icons.water_drop_outlined, title: 'HUMIDITY', reading: '40%'),
        buildWeatherCondition(icon: Icons.air_rounded, title: 'WIND', reading: '4.63km/h'),
        buildWeatherCondition(icon: Icons.thermostat_outlined, title: 'FEELS LIKE', reading: '22°'),
      ],
    );
  }

  Widget buildOtherDaysWeather() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            color: Colors.black.withOpacity(0.3)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildDayWeatherInfo(
                date: 'Wed 15',
                icon: Icons.thunderstorm_rounded,
                temp: '22°',
                wind: '1.5'
            ),

            buildDayWeatherInfo(
                date: 'Thu 16',
                icon: Icons.cloudy_snowing,
                temp: '22°',
                wind: '1.5'
            ),

            buildDayWeatherInfo(
                date: 'Fri 17',
                icon: Icons.sunny_snowing,
                temp: '22°',
                wind: '1.5'
            ),

            buildDayWeatherInfo(
                date: 'Sat 18',
                icon: Icons.sunny,
                temp: '22°',
                wind: '1.5'
            )
          ],
        ),
      ),
    );
  }

  Widget buildWeatherCondition({IconData? icon, String? title, String? reading }) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: Colors.white, size: 45,),
          Text(title!, style: const TextStyle(color: Colors.white, fontSize: 12),),
          Text(reading!, style: const TextStyle(color: Colors.white, fontSize: 11,),),
        ],
      );
  }

  Widget buildDayWeatherInfo({IconData? icon, String? date, String? temp, String? wind}){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(date!, style: const TextStyle(color: Colors.white, fontSize: 16),),
        const Gap(10),
        Icon(icon, color: Colors.white, size: 55,),
        const Gap(5),
        Text(temp!, style: const TextStyle(color: Colors.white, fontSize: 18,),),
        const Gap(10),
        Column(
          children: [
            Text(wind!, style: const TextStyle(color: Colors.white, fontSize: 15),),
            Text('km/h', style: const TextStyle(color: Colors.white, fontSize: 15),),
          ],
        ),
      ],
    );
  }


}
