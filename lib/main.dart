import 'package:flutter/material.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/feature/app_screen.dart';
import 'package:weather/repository/weather_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final dynamic _weatherApi = WeatherApi();

  late final _weatherRepository = WeatherRepository(remoteApi: _weatherApi);


@override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  _fetchWeather(){
    _weatherRepository.getWeather(city: 'cebu');
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beautiful Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppScreen(),
    );
  }
}


