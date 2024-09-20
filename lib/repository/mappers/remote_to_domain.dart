/*
* Developer: Abubakar Abdullahi
* Date: 14/09/2024
*/

import 'package:weather/api/models/models.dart';
import 'package:weather/domain_model/domain_model.dart';

WeatherForecast mapRemoteToDomainModel (WeatherForecastRM weather, GeocodingRM geo) {
  return WeatherForecast(
      cod: weather.cod,
      message: weather.message,
      cnt: weather.cnt,
      city: weather.city!.toDomain(),
      list: weather.list!.map((ls) => ls.toDomain()).toList(),
      cityName: geo.name,
  );
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
