/*
* Developer: Abubakar Abdullahi
* Date: 01/11/2024
*/


import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'models/weather_forecast_cm.dart';

class CacheConfig {
  static const _forecastPagesBoxKey = 'weather-forecast';

   CacheConfig({
    @visibleForTesting HiveInterface? hive,
  }) : _hive = hive ?? Hive {
    try {
      _hive
          ..registerAdapter(WeatherForecastCMAdapter())
          ..registerAdapter(CityCMAdapter())
          ..registerAdapter(WeatherListCMAdapter())
          ..registerAdapter(MainCMAdapter())
          ..registerAdapter(WeatherCMAdapter())
          ..registerAdapter(WindCMAdapter());
    }catch (_){
      throw Exception(
          'You shouldn\'t have more than one [LocalStorage] instance in your project'
      );
    }
  }

  final HiveInterface _hive;

  Future<Box<WeatherForecastCM>> get weatherForecastBox =>
      _openHiveBox<WeatherForecastCM>(
        _forecastPagesBoxKey,
        isTemporary: true,
      );

  Future<Box<T>> _openHiveBox<T>(String boxKey,{required bool isTemporary}) async {
    if(_hive.isBoxOpen(boxKey)){
      return _hive.box(boxKey);
    }
    else{
      if(kIsWeb){
        return _hive.openBox<T>(boxKey);
      }

      final directory = await (isTemporary ? getTemporaryDirectory() : getApplicationDocumentsDirectory());
      return _hive.openBox<T>(boxKey, path: directory.path);
    }
  }


}