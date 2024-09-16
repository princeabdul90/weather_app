/*
* Developer: Abubakar Abdullahi
* Date: 2/2/2024
*/

class UrlBuilder {

  const UrlBuilder({
     String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://api.openweathermap.org/data/2.5/forecast';

  final String _baseUrl;

  String buildSearchWeatherForecastByCoordinates({double? lat, double? long, String? apiKey}){
    return '$_baseUrl?lat=$lat&lon=$long&appid=$apiKey';
  }
}

class GeoCodingUrlBuilder {

  final String _baseUrl;

  const GeoCodingUrlBuilder({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://api.openweathermap.org/geo/1.0/direct';

  String buildCityCoordinate({String? city, String? apiKey}) {
    return '$_baseUrl?q=$city&limit=1&appid=$apiKey';
  }
}