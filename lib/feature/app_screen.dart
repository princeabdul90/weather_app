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
                color: Colors.black.withOpacity(0.6)
            ),
          ),
          
          Column(
            children: [
              const Gap(40),
              buildLocation(),

              const Gap(40),
              buildDate(),

              const Gap(40),
              buildCurrentWeatherTemp(),
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
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.sunny, color: Colors.white,),
        Text('Clear', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w400),),
        Text('40℃', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold   ),),
      ],
    );
  }
}
