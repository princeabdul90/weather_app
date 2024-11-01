/*
* Developer: Abubakar Abdullahi
* Date: 2/2/2024
*/

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/api/url_builder.dart';
import 'package:weather/models/models.dart';

class WeatherApi {
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

  Future<GeocodingRM> getDirectGeocoding({String? city}) {
    var appId = dotenv.get('API_KEY');
    final url = _geoCodeUrlBuilder.buildGetCoordinateByCityName(city: city, apiKey: appId);
    return _getGeocoding(url);
  }

  Future<GeocodingRM> getReverseGeocoding({double? lat, double? long}) {
    var appId = dotenv.get('API_KEY');
    final url = _geoCodeUrlBuilder.buildGetCityNameByCoordinate(lat: lat, long: long, apiKey: appId);
    return _getGeocoding(url);
  }

  Future<WeatherForecastRM?> getCityWeatherInfo({String? city, double? lat, double? long}) async {

    GeocodingRM geocodingRM = GeocodingRM();
    if(city != null){
      geocodingRM = await getDirectGeocoding(city: city);
    }

    if(lat != null && long != null){
      geocodingRM = await getReverseGeocoding(lat: lat, long: long);
    }


    var appId = dotenv.get('API_KEY');
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

  Future<GeocodingRM> _getGeocoding(url) async {
    try{
    final   response = await _dio.get(url, );
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




}
