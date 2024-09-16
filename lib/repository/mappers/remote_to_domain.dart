/*
* Developer: Abubakar Abdullahi
* Date: 14/09/2024
*/

import 'package:weather/api/models/models.dart';
import 'package:weather/domain_model/domain_model.dart';

extension WeatherForecastRMtoDomain on WeatherForecastRM {
  WeatherForecast toDomain(){
    return WeatherForecast(
      cod: cod,
      message: message,
      cnt: cnt,
      city: city!.toDomain(),
      list: list!.map((ls) => ls.toDomain()).toList()
    );
  }
}

extension WeatherListRMtoDomain on WeatherListRM {
  WeatherList toDomain(){
    return WeatherList(
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

extension CityRMtoDomain on CityRM {
  City toDomain(){
    return City(
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

extension MainRMtoDomain on MainRM {
  Main toDomain(){
    return Main(
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

extension WeatherRMtoDomain on WeatherRM {
  Weather toDomain() {
    return Weather(id: id, main: main, description: description, icon: icon);
  }
}

extension WindRMtoDomain on WindRM {
  Wind toDomain() {
    return Wind(speed: speed, deg: deg, gust: gust);
  }
}
