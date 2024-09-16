/*
* Developer: Abubakar Abdullahi
* Date: 2/2/2024
*/

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/api/models/models.dart';
import 'package:weather/api/url_builder.dart';

class WeatherApi {
  static const _apiKey = 'open_weather_app_token';

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

    // todo: check device location city if city input is null

    try{
      final response = await _dio.get(url, );
      final jsonObject = response.data;
      final coordinate = GeocodingRM.fromJson(jsonObject);
      return coordinate;
    } on DioException catch (error){
      if(error.response != null){
        throw WeatherErrorRemoteException();
      }
      rethrow;
    }
  }

  Future<WeatherForecastRM?> getCityWeatherInfo(GeocodingRM geocodingRM) async {

    const appId = String.fromEnvironment(_apiKey);
    final url = _urlBuilder.buildSearchWeatherForecastByCoordinates(
        lat: geocodingRM.lat,
        long: geocodingRM.lon,
        apiKey: appId,
    );

    try {
      final response = await _dio.get(url);
      final jsonObject = response.data;
      final weather = WeatherForecastRM.fromJson(jsonObject);
      return weather;
    } on DioException catch (error) {
      if(error.response != null){
        if(error.response?.data['cod'] == 401){
          throw EmptyApiIdException();
        }
        if(error.response?.data['cod'] == 400){
          throw WeatherErrorRemoteException();
        }
      }
      rethrow;
    }
  }


}
