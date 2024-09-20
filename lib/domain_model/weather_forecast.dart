/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
*/


import 'package:equatable/equatable.dart';

class WeatherForecast extends Equatable {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<WeatherList>? list;
  final City? city;
  final String? cityName;

  const WeatherForecast({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
    this.cityName
  });

  @override
  List<Object?> get props => [cod, message, cnt, list, city, cityName];
}

class City extends Equatable {
  final int? id;
  final String? name;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  const City({
    this.id,
    this.name,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  @override
  List<Object?> get props =>
      [id, name, country, population, timezone, sunrise, sunset,];
}

class WeatherList extends Equatable {
  final int? dt;
  final Main? main;
  final List<Weather>? weather;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final DateTime? dtTxt;

  const WeatherList({
    this.dt,
    this.main,
    this.weather,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
  });

  @override
  List<Object?> get props => [dt, main, weather, wind, visibility, pop, dtTxt,];

}

class Main extends Equatable {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  const Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  @override
  List<Object?> get props =>
      [
        temp,
        feelsLike,
        tempMin,
        tempMax,
        pressure,
        seaLevel,
        grndLevel,
        humidity,
        tempKf,
      ];
}

class Weather extends Equatable {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  const Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props => [id, main, description, icon];
}

class Wind extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  List<Object?> get props => [speed, deg, gust];
}