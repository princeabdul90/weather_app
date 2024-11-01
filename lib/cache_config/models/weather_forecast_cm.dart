/*
* Developer: Abubakar Abdullahi
* Date: 01/11/2024
*/

import 'package:hive/hive.dart';

part 'weather_forecast_cm.g.dart';

@HiveType(typeId: 0)
class WeatherForecastCM {
  @HiveField(0)
  final String? cod;
  @HiveField(1)
  final dynamic? message;
  @HiveField(2)
  final int? cnt;
  @HiveField(3)
  final List<WeatherListCM>? list;
  @HiveField(4)
  final CityCM? city;
  @HiveField(5)
  String? timestamp;

  WeatherForecastCM({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
    this.timestamp
  });


}

@HiveType(typeId: 1)
class CityCM {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? country;
  @HiveField(3)
  final int? population;
  @HiveField(4)
  final int? timezone;
  @HiveField(5)
  final int? sunrise;
  @HiveField(6)
  final int? sunset;

  CityCM({
    this.id,
    this.name,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });
}

@HiveType(typeId: 2)
class WeatherListCM {
  @HiveField(0)
  final int? dt;
  @HiveField(1)
  final MainCM? main;
  @HiveField(2)
  final List<WeatherCM>? weather;
  @HiveField(3)
  final WindCM? wind;
  @HiveField(4)
  final int? visibility;
  @HiveField(5)
  final double? pop;
  @HiveField(6)
  final DateTime? dtTxt;

  WeatherListCM({
    this.dt,
    this.main,
    this.weather,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
  });
}

@HiveType(typeId: 3)
class MainCM {
    @HiveField(0)
  final double? temp;
    @HiveField(1)
  final double? feelsLike;
    @HiveField(2)
  final double? tempMin;
    @HiveField(3)
  final double? tempMax;
    @HiveField(4)
  final int? pressure;
    @HiveField(5)
  final int? seaLevel;
    @HiveField(6)
  final int? grndLevel;
    @HiveField(7)
  final int? humidity;
  @HiveField(8)
  final double? tempKf;

  MainCM({
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
}

@HiveType(typeId: 4)
class WeatherCM {
    @HiveField(0)
  final int? id;
    @HiveField(1)
  final String? main;
    @HiveField(2)
  final String? description;
    @HiveField(3)
  final String? icon;

  WeatherCM({
    this.id,
    this.main,
    this.description,
    this.icon,
  });
}

@HiveType(typeId: 5)
class WindCM {
    @HiveField(0)
  final double? speed;
    @HiveField(1)
  final int? deg;
    @HiveField(2)
  final double? gust;

  WindCM({
    this.speed,
    this.deg,
    this.gust,
  });
}

/*
// @HiveType(typeId: 0)
// class ForecastCM {
//   ForecastCM({ required this.data, required this.timestamp});
//
//   @HiveField(0)
//   WeatherForecastCM data;
//
//   @HiveField(1)
//   String timestamp;
//
//   @override
//   String toString() {
//     return 'ForecastCM{data: $data, timestamp: $timestamp}';
//   }
// }
 */