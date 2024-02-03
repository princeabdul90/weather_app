/*
* Developer: Abubakar Abdullahi
* Date: 2/2/2024
* Company: ESAT PILIPINAS TEKNIK, OPC
*/

// api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}
const count  = 1;
const units  = 'metric';

class UrlBuilder {

  const UrlBuilder({
     String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://api.openweathermap.org/data/2.5/forecast';

  final String _baseUrl;

  String buildSearchWeatherForecastByCoordinates({double? lat, double? long, String? apiKey}){
    return '$_baseUrl?lat=$lat&lon=$long&cnt=$count&units=$units&appid=$apiKey';
  }

  // String buildSearchWeatherForecastByCityName({String? city, String? apiKey}){
  //   return '$_baseUrl?q=$city&cnt=$count&units=$units&appid=$apiKey';
  // }

}