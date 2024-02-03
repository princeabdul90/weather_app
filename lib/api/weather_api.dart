/*
* Developer: Abubakar Abdullahi
* Date: 2/2/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/api/models/models.dart';
import 'package:weather/api/url_builder_geocoding.dart';

import 'package:weather/api/url_builder.dart';

class WeatherApi {
  static const _apiKey = 'open-weather-api-key';

  WeatherApi({
    @visibleForTesting Dio? dio,
    @visibleForTesting GeoCodingUrlBuilder? geoCodeUrlBuilder,
    @visibleForTesting UrlBuilder? urlBuilder,
  })  : _dio = dio ?? Dio(),
        _geoCodeUrlBuilder = geoCodeUrlBuilder ?? const GeoCodingUrlBuilder(),
        _urlBuilder = urlBuilder ?? const UrlBuilder();

  final Dio _dio;
  final GeoCodingUrlBuilder _geoCodeUrlBuilder;
  final UrlBuilder _urlBuilder;

  Future<GeocodingRM> getDirectGeocoding({String? city}) async {
    const appId = String.fromEnvironment(_apiKey);
    final url = _geoCodeUrlBuilder.buildCityCoordinate(city: city, apiKey: appId);

    try{
      final response = await _dio.get(url);
      final jsonObject = response.data;
      final coordinate = GeocodingRM.fromJson(jsonObject['0']);
      return coordinate;
    } on DioException catch (error){
      if(error.response != null){
        throw WeatherErrorException();
      }
      rethrow;
    }
  }

  Future<WeatherRM?> getCityWeatherInfo(GeocodingRM geocodingRM) async {
    const appId = String.fromEnvironment(_apiKey);
    final url = _urlBuilder.buildSearchWeatherForecastByCoordinates(
        lat: geocodingRM.lat,
        long: geocodingRM.lon,
        apiKey: appId,
    );

    try {
      final response = await _dio.get(url);
      final jsonObject = response.data;
      final weather = WeatherRM.fromJson(jsonObject);
      return weather;
    } on DioException catch (error) {
      if(error.response != null){
        throw WeatherErrorException();
      }
      rethrow;
    }
  }


}
