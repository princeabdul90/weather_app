/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/


class GeocodingRM {
  final String? name;
  final LocalNames? localNames;
  final double? lat;
  final double? lon;
  final String? country;

  GeocodingRM({
    this.name,
    this.localNames,
    this.lat,
    this.lon,
    this.country,
  });

  factory GeocodingRM.fromJson(Map<String, dynamic> json) => GeocodingRM(
    name: json["name"],
    localNames: json["local_names"] == null ? null : LocalNames.fromJson(json["local_names"]),
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    country: json["country"],
  );

}

class LocalNames {

  final String? en;

  LocalNames({
    this.en,

  });

  factory LocalNames.fromJson(Map<String, dynamic> json) => LocalNames(
    en: json["en"],
  );


}
