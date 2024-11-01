part of 'weather_forecast_bloc.dart';

sealed class WeatherForecastEvent extends Equatable {
  const WeatherForecastEvent();

  @override
  List<Object> get props => [];
}

class SearchCityForecastEvent extends WeatherForecastEvent {
  final String city;

  const SearchCityForecastEvent({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}

class InvalidateCacheEvent extends WeatherForecastEvent {
  final String city;

  const InvalidateCacheEvent({
    required this.city,
  });

  @override
  List<Object> get props => [city];
}