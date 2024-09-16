import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:weather/api/models/response/geocoding_rm.dart';
import 'package:weather/api/models/response/weather_forecast_rm.dart';
import 'package:weather/api/url_builder.dart';
import 'package:weather/api/weather_api.dart';

void main() {
  group('WeatherSearch', () {
    final dio = Dio(BaseOptions());
    final dioAdapter = DioAdapter(dio: dio);

    const lat = 10.34953135;
    const lon = 123.7816926670584;
    final remoteApi = WeatherApi(dio: dio);

    const appId = String.fromEnvironment('open_weather_app_token');
    final url = const UrlBuilder().buildSearchWeatherForecastByCoordinates(apiKey: appId, lat: lat, long: lon);

    final geoCodeJson = GeocodingRM( lat: lat, lon: lon);

    test('When lat & lon is entered, return an instance of WeatherForecastRM', () async {
      dioAdapter.onGet(
        url,
            (server) => server.reply(
          200,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      expect(await remoteApi.getCityWeatherInfo(geoCodeJson), isA<WeatherForecastRM>());
    });

  });
}
