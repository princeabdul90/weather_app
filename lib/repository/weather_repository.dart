/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* */

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/cache_config/cache_config.dart';
import 'package:weather/domain_model/domain_model.dart';
import 'package:weather/models/models.dart';
import 'package:weather/repository/mappers/cache_to_domain.dart';
import 'package:weather/repository/mappers/remote_to_cache.dart';
import 'package:weather/repository/weather_local_storage.dart';


class WeatherRepository {

   WeatherRepository( {
    required this.remoteApi,
    required CacheConfig cacheConfig,
     @visibleForTesting WeatherLocalStorage? localStorage,
  }): _localStorage = localStorage ?? WeatherLocalStorage(cacheConfig: cacheConfig);

  final WeatherApi remoteApi;
  final WeatherLocalStorage _localStorage;


  final Duration cacheDuration = const Duration(minutes: 10);

  // Stream controller for broadcasting data
   final StreamController<WeatherForecastRM> _weatherStreamController = StreamController.broadcast();
  // Expose stream of weather data
  Stream<WeatherForecastRM> get weatherStream => _weatherStreamController.stream;


   // Fetch weather data from API or cache
   Future<void> getWeather({String? city}) async {
    var cacheKey = 'weather_$city';
    final cachedData = await _localStorage.getCacheWeatherData(cacheKey);

    // Check cache validity
    if (cachedData != null) {
      final DateTime cacheTime = DateTime.parse(cachedData.timestamp!);

      if (DateTime.now().difference(cacheTime) < cacheDuration) {

        _weatherStreamController.add(cachedData.toDomain()); // Use cached data
        return;
      } else {
        _localStorage.deleteCacheData(cacheKey); // Cache expired, delete it
      }
    }
    try {

      if(city == null || city == ''){

        bool serviceEnabled;
        LocationPermission permission;
        Position locationData;

        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          // Location services are not enabled don't continue
          // accessing the position and request users of the
          // App to enable the location services.
          //return Future.error('Location services are disabled.');
          throw EnableServiceException();
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            //return Future.error('Location permissions are denied');
            throw GrantPermissionException();
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          throw ForeverGrantPermissionException();
          // return Future.error(
          //     'Location permissions are permanently denied, we cannot request permissions.');
        }

        locationData = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

        final tempWeather = await remoteApi.getCityWeatherInfo(lat: locationData.latitude, long: locationData.longitude);

        _localStorage.upsertWeatherData(cacheKey, tempWeather!.toCacheModel());

        _weatherStreamController.add(tempWeather);
      }

      final tempWeather = await remoteApi.getCityWeatherInfo(city: city);

      _localStorage.upsertWeatherData(cacheKey, tempWeather!.toCacheModel());

      _weatherStreamController.add(tempWeather);

    }catch (error){
      if(error  is WeatherErrorRemoteException){
        throw WeatherErrorException();
      }
      rethrow;
    }
  }

   // Invalidate cache for a specific city
   void invalidateCache(String city) {
     _localStorage.invalidateCache('weather_$city');
   }

   // Clear all cached weather data
   void clearAllCache() {
     _localStorage.clearWeatherData();
   }

   // Dispose the stream controller when no longer needed
   void dispose() {
     _weatherStreamController.close();
   }

}