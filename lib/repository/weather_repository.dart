/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/

import 'package:weather/api/models/models.dart';
import 'package:weather/api/weather_api.dart';
import 'package:weather/domain_model/domain_model.dart';
import 'package:weather/repository/mappers/remote_to_domain.dart';

class WeatherRepository {

  const WeatherRepository({
    required this.remoteApi,
  });

  final WeatherApi remoteApi;

  Future<WeatherForecast?> getWeather({String? city}) async {
    try {
      final geoCoding = await remoteApi.getDirectGeocoding(city: city);

      final tempWeather = await remoteApi.getCityWeatherInfo(geoCoding);

      /// final WeatherForecastRM weather = tempWeather!.copyWith(name: geoCoding.name, country: geoCoding.country);
      final  weather = tempWeather!.toDomain();

      return weather;
    }catch (error){
      if(error  is WeatherErrorRemoteException){
        throw WeatherErrorException();
      }
      rethrow;
    }
  }

}