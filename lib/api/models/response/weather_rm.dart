/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/

class WeatherRM {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ListElement>? list;
  final City? city;
  final String? name;
  final String? country;

  WeatherRM( {
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
    this.name,
    this.country,
  });

  WeatherRM copyWith({
    String? cod,
    int? message,
    int? cnt,
    List<ListElement>? list,
    City? city,
    String? name,
    String? country,
  }) =>
      WeatherRM(
        cod: cod ?? this.cod,
        message: message ?? this.message,
        cnt: cnt ?? this.cnt,
        list: list ?? this.list,
        city: city ?? this.city,
        name: name ?? this.name,
        country: country ?? this.country
      );

  factory WeatherRM.fromJson(Map<String, dynamic> json) => WeatherRM(
    cod: json["cod"],
    message: json["message"],
    cnt: json["cnt"],
    list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    city: json["city"] == null ? null : City.fromJson(json["city"]),
    name: '',
    country: ''
  );

}

class Main {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? seaLevel;
  final int? grndLevel;
  final int? humidity;
  final double? tempKf;

  Main({
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

  factory Main.fromJson(Map<String, dynamic> json) => Main(
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

class ListElement {
  final int? dt;
  final Main? main;
  final List<WeatherData>? weather;
  final Clouds? clouds;
  final Wind? wind;
  final int? visibility;
  final double? pop;
  final Sys? sys;
  final DateTime? dtTxt;
  final Rain? rain;

  ListElement({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.sys,
    this.dtTxt,
    this.rain,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    dt: json["dt"],
    main: json["main"] == null ? null : Main.fromJson(json["main"]),
    weather: json["weather"] == null ? [] : List<WeatherData>.from(json["weather"]!.map((x) => WeatherData.fromJson(x))),
    clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
    wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
    visibility: json["visibility"],
    pop: json["pop"]?.toDouble(),
    sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
    dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
    rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
  );

  Map<String, dynamic> toJson() => {
    "dt": dt,
    "main": main?.toJson(),
    "weather": weather == null ? [] : List<dynamic>.from(weather!.map((x) => x.toJson())),
    "clouds": clouds?.toJson(),
    "wind": wind?.toJson(),
    "visibility": visibility,
    "pop": pop,
    "sys": sys?.toJson(),
    "dt_txt": dtTxt?.toIso8601String(),
    "rain": rain?.toJson(),
  };
}

class WeatherData {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherData({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"]?.toDouble(),
    deg: json["deg"],
    gust: json["gust"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
    "gust": gust,
  };
}

//-------- UNUSED MODEL DATA

/// to be deleted - not needed in the app
class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
    country: json["country"],
    population: json["population"],
    timezone: json["timezone"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "coord": coord?.toJson(),
    "country": country,
    "population": population,
    "timezone": timezone,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}
/// to be deleted - not needed in the app
class Coord {
  final double? lat;
  final double? lon;

  Coord({
    this.lat,
    this.lon,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lon": lon,
  };
}

/// to be deleted - not needed in the app
class Clouds {
  final int? all;

  Clouds({
    this.all,
  });

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}


/// to be deleted - not needed in the app
class Rain {
  final double? the3H;

  Rain({
    this.the3H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
    the3H: json["3h"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "3h": the3H,
  };
}

/// to be deleted - not needed in the app
class Sys {
  final String? pod;

  Sys({
    this.pod,
  });

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    pod: json["pod"],
  );

  Map<String, dynamic> toJson() => {
    "pod": pod,
  };
}


