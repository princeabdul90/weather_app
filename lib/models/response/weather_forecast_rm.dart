/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/


class WeatherForecastRM {
  final String? cod;
  final dynamic? message;
  final int? cnt;
  final List<WeatherListRM>? list;
  final CityRM? city;

  WeatherForecastRM({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory WeatherForecastRM.fromJson(Map<String, dynamic> json) => WeatherForecastRM(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: json["list"] == null ? [] : List<WeatherListRM>.from(json["list"]!.map((x) => WeatherListRM.fromJson(x))),
    city: json["city"] == null ? null : CityRM.fromJson(json["city"]),
  );
}

class CityRM {
  final int? id;
  final String? name;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  CityRM({
    this.id,
    this.name,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory CityRM.fromJson(Map<String, dynamic> json) => CityRM(
    id: json["id"],
    name: json["name"],
    country: json["country"],
    population: json["population"],
    timezone: json["timezone"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );
}

class WeatherListRM {
  final int? dt;
  final MainRM? main;
  final List<WeatherRM>? weather;
  final WindRM? wind;
  final int? visibility;
  final double? pop;
  final DateTime? dtTxt;

  WeatherListRM({
    this.dt,
    this.main,
    this.weather,
    this.wind,
    this.visibility,
    this.pop,
    this.dtTxt,
  });

  factory WeatherListRM.fromJson(Map<String, dynamic> json) => WeatherListRM(
    dt: json["dt"],
    main: json["main"] == null ? null : MainRM.fromJson(json["main"]),
    weather: json["weather"] == null ? [] : List<WeatherRM>.from(json["weather"]!.map((x) => WeatherRM.fromJson(x))),
    wind: json["wind"] == null ? null : WindRM.fromJson(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"]?.toDouble(),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
  );

}

class MainRM {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  MainRM({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.grndLevel,
    this.humidity,
    this.tempKf,
  });

  factory MainRM.fromJson(Map<String, dynamic> json) => MainRM(
    temp: json["temp"]?.toDouble(),
    feelsLike: json["feels_like"]?.toDouble(),
    tempMin: json["temp_min"]?.toDouble(),
    tempMax: json["temp_max"]?.toDouble(),
    pressure: json["pressure"],
    seaLevel: json["sea_level"],
    grndLevel: json["grnd_level"],
    humidity: json["humidity"],
    tempKf: json["temp_kf"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "sea_level": seaLevel,
    "grnd_level": grndLevel,
    "humidity": humidity,
    "temp_kf": tempKf,
  };
}

class WeatherRM {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherRM({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherRM.fromJson(Map<String, dynamic> json) => WeatherRM(
    id: json["id"],
    main: json["main"]!,
    description: json["description"]!,
    icon: json["icon"]!,
  );
}

class WindRM {
  final double? speed;
  final int? deg;
  final double? gust;

  WindRM({
    this.speed,
    this.deg,
    this.gust,
  });

  factory WindRM.fromJson(Map<String, dynamic> json) => WindRM(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );
}