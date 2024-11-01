/*
* Developer: Abubakar Abdullahi
* Date: 01/11/2024
*/

import 'package:weather/cache_config/models/weather_forecast_cm.dart';
import 'package:weather/models/models.dart';


extension WeatherForecastRMtoCM on WeatherForecastRM {
  WeatherForecastCM toCacheModel(){
    return WeatherForecastCM(
      cod: cod,
      message: message,
      cnt: cnt,
      city: city!.toCacheModel(),
      list: list!.map((ls) => ls.toCacheModel()).toList(),
        timestamp: DateTime.now().toIso8601String()
    );
  }

}

extension WeatherListRMtoCM on WeatherListRM {
  WeatherListCM toCacheModel(){
    return WeatherListCM(
        dt: dt,
        main: main!.toCacheModel(),
        weather: weather!.map((wt) => wt.toCacheModel()).toList(),
        wind: wind!.toCacheModel(),
        visibility: visibility,
        pop: pop,
        dtTxt: dtTxt
    );
  }
}

extension CityRMtoCM on CityRM {
  CityCM toCacheModel(){
    return CityCM(
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

extension MainRMtoCM on MainRM {
  MainCM toCacheModel(){
    return MainCM(
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

extension WeatherRMtoCM on WeatherRM {
  WeatherCM toCacheModel() {
    return WeatherCM(id: id, main: main, description: description, icon: icon);
  }
}

extension WindRMtoCM on WindRM {
  WindCM toCacheModel() {
    return WindCM(speed: speed, deg: deg, gust: gust);
  }
}