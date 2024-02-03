/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/

import 'package:weather/api/models/models.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/domain_model/domain_model.dart';

class WeatherRepository {

  const WeatherRepository({
    required this.remoteApi,
  });

  final WeatherApi remoteApi;

  // todo: change the return remote model to domain model
  Future<WeatherRM?> getWeather({String? city}) async {
    try {
      final geoCoding = await remoteApi.getDirectGeocoding(city: city);
      print('DirectGeocoding: $geoCoding');

      final tempWeather = await remoteApi.getCityWeatherInfo(geoCoding);
      print('TempWeather: $tempWeather');

      final WeatherRM weather = tempWeather!.copyWith(name: geoCoding.name, country: geoCoding.country);

      return weather;
    }catch (error){
      if(error  is WeatherErrorException){
        throw WeatherErrorException();
      }
      rethrow;
    }
  }

}