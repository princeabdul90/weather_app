/*
* Developer: Abubakar Abdullahi
* Date: 2/2/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/

class GeoCodingUrlBuilder {

  final String _baseUrl;

  const GeoCodingUrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://api.openweathermap.org/geo/1.0/direct';


  String buildCityCoordinate({String? city, String? apiKey}) {
    return '$_baseUrl?q=$city&limit=1&appid=$apiKey';
  }
}