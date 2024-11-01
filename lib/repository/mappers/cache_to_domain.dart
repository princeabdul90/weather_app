/*
* Developer: Abubakar Abdullahi
* Date: 14/09/2024
*/


import 'package:weather/cache_config/models/weather_forecast_cm.dart';
import 'package:weather/models/models.dart';


extension WeatherForecastCMtoDomain on WeatherForecastCM {
  WeatherForecastRM toDomain(){
    return WeatherForecastRM(
        cod: cod,
        message: message,
        cnt: cnt,
        city: city!.toDomain(),
        list: list!.map((ls) => ls.toDomain()).toList(),
    );
  }

}

extension WeatherListCMtoDomain on WeatherListCM {
  WeatherListRM toDomain(){
    return WeatherListRM(
      dt: dt,
      main: main!.toDomain(),
      weather: weather!.map((wt) => wt.toDomain()).toList(),
      wind: wind!.toDomain(),
      visibility: visibility,
      pop: pop,
      dtTxt: dtTxt
    );
  }
}

extension CityCMtoDomain on CityCM {
  CityRM toDomain(){
    return CityRM(
      id: id,
      name: name,
      country: country,
      population: population,
      timezone: timezone,
      sunrise: sunrise,
      sunset: sunset
    );
  }
}

extension MainCMtoDomain on MainCM {
  MainRM toDomain(){
    return MainRM(
      temp: temp,
      feelsLike: feelsLike,
      tempMin: tempMin,
      tempMax: tempMax,
      pressure: pressure,
      seaLevel: seaLevel,
      grndLevel: grndLevel,
      humidity: humidity,
      tempKf: tempKf
    );
  }
}

extension WeatherCMtoDomain on WeatherCM {
  WeatherRM toDomain() {
    return WeatherRM(id: id, main: main, description: description, icon: icon);
  }
}

extension WindCMtoDomain on WindCM {
  WindRM toDomain() {
    return WindRM(speed: speed, deg: deg, gust: gust);
  }
}
