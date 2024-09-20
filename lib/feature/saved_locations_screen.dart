/*
* Developer: Abubakar Abdullahi
* Date: 17/09/2024
*/
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SavedLocationsScreen extends StatelessWidget {
  const SavedLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SavedLocationView(),
    );
  }
}

class SavedLocationView extends StatelessWidget {
  const SavedLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      )),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            height: 90,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Saved Locations',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins'),
                ),
                Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 30,
                )
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _CityForecastWidget(
                    cityName: 'Paris',
                    weatherDescription: 'Clear',
                    humidity: '65',
                    wind: '4.63',
                    temp: '24',
                    icon: '01d',
                  ),
                  _CityForecastWidget(
                    cityName: 'London',
                    weatherDescription: 'Clouds',
                    humidity: '56',
                    wind: '4.63',
                    temp: '16',
                    icon: '03d',
                  ),
                  _CityForecastWidget(
                    cityName: 'New York',
                    weatherDescription: 'Thunderstorm',
                    humidity: '34',
                    wind: '9.63',
                    temp: '25',
                    icon: '11d',
                  ),
                  _CityForecastWidget(
                    cityName: 'Paris',
                    weatherDescription: 'Clear',
                    humidity: '65',
                    wind: '4.63',
                    temp: '24',
                    icon: '01d',
                  ),
                  _CityForecastWidget(
                    cityName: 'London',
                    weatherDescription: 'Clouds',
                    humidity: '56',
                    wind: '4.63',
                    temp: '16',
                    icon: '03d',
                  ),
                  _CityForecastWidget(
                    cityName: 'New York',
                    weatherDescription: 'Thunderstorm',
                    humidity: '34',
                    wind: '9.63',
                    temp: '25',
                    icon: '11d',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CityForecastWidget extends StatelessWidget {
  const _CityForecastWidget(
      {super.key,
      required this.cityName,
      required this.weatherDescription,
      required this.humidity,
      required this.wind,
      required this.temp,
      required this.icon});

  final String cityName;
  final String weatherDescription;
  final String humidity;
  final String wind;
  final String temp;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: const Color(0xFFAAA5A5).withOpacity(0.3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cityName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'),
                  ),
                  Text(
                    weatherDescription,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Humidity',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Roboto'),
                      ),
                      const Gap(10),
                      Text(
                        '$humidity%',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Wind',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Roboto'),
                      ),
                      const Gap(10),
                      Text(
                        '${wind}km/h',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                "https://openweathermap.org/img/wn/$icon@2x.png",
                height: 56,
                width: 56,
              ),
              Text(
                '$temp ℃',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
