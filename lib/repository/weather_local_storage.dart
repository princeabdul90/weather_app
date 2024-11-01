/*
* Developer: Abubakar Abdullahi
* Date: 01/11/2024
*/

import 'package:weather/cache_config/cache_config.dart';
import 'package:weather/cache_config/models/weather_forecast_cm.dart';

class WeatherLocalStorage {

  const WeatherLocalStorage({
    required this.cacheConfig,
  });

  final CacheConfig cacheConfig;

  Future<void> upsertWeatherData(String cacheKey,WeatherForecastCM data) async {
    final box = await cacheConfig.weatherForecastBox;
    return box.put(cacheKey, data);
  }

  // Clear all cached weather data
  Future<void> clearWeatherData() async {
    final box = await cacheConfig.weatherForecastBox;
    await box.clear();
  }

  Future<void> deleteCacheData(String cacheKey) async {
    final box = await cacheConfig.weatherForecastBox;
    await box.delete(cacheKey);
  }

  // Invalidate cache for a specific city
  Future<void> invalidateCache(String city) async {
    final box = await cacheConfig.weatherForecastBox;
    await box.delete('weather_$city');
  }

  Future<WeatherForecastCM?> getCacheWeatherData(String cacheKey) async {
    final box = await cacheConfig.weatherForecastBox;
    return box.get(cacheKey);
  }


}