/*
* Developer: Abubakar Abdullahi
* Date: 2/3/2024
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

  factory GeocodingRM.fromJson(List<dynamic> json) {
    //final Map<String, dynamic> data = json[0];
    final Map data = json[0];
    return GeocodingRM(
      name: data["name"],
      localNames: data["local_names"] == null ? null : LocalNames.fromJson(data["local_names"]),
      lat: data["lat"]?.toDouble(),
      lon: data["lon"]?.toDouble(),
      country: data["country"],
    );
  }
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
