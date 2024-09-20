/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* */

import 'package:geolocator/geolocator.dart';
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
          print("Enable Location: ${serviceEnabled}");
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
            print("Permission: ${permission}");
            throw GrantPermissionException();
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          print("Permission: ${permission}");
          throw ForeverGrantPermissionException();
          // return Future.error(
          //     'Location permissions are permanently denied, we cannot request permissions.');
        }

        locationData = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        final geocoding = GeocodingRM(lat: locationData.latitude, lon: locationData.longitude);
        final tempWeather = await remoteApi.getCityWeatherInfo(geocoding);

        final city = await remoteApi.getReverseGeocoding(lat: locationData.latitude, long: locationData.longitude);
        // print("City: ${city.name}, Local Name: ${city.localNames!.en}, Lat: ${city.lat}, Long: ${city.lon}");
        // print("Lat: ${locationData.latitude}, Long: ${locationData.longitude}");

        /// final WeatherForecastRM weather = tempWeather!.copyWith(name: geoCoding.name, country: geoCoding.country);
        //final  weather = tempWeather!.toDomain();
        final  weather = mapRemoteToDomainModel(tempWeather!, city);
        return weather;
      }

      final geoCoding = await remoteApi.getDirectGeocoding(city: city);
      final tempWeather = await remoteApi.getCityWeatherInfo(geoCoding);

     //final  weather = tempWeather!.toDomain();
      final  weather = mapRemoteToDomainModel(tempWeather!, geoCoding);
      return weather;
    }catch (error){
      if(error  is WeatherErrorRemoteException){
        throw WeatherErrorException();
      }
      rethrow;
    }
  }

}