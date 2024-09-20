part of 'weather_forecast_bloc.dart';

enum Status { initial, loading, success, error }

class WeatherForecastState extends Equatable {
  final Status status;
  final WeatherList? day1;
  final WeatherList? day2;
  final WeatherList? day3;
  final WeatherList? day4;
  final WeatherList? day5;
  final String? cityName;
  final String? errorMsg;

  const WeatherForecastState({
    required this.status,
    this.day1,
    this.day2,
    this.day3,
    this.day4,
    this.day5,
    this.cityName,
    this.errorMsg
  });

  factory WeatherForecastState.initial(){
    return const WeatherForecastState(
      status: Status.initial,
    );
  }

  WeatherForecastState copyWith({
    Status? status,
    final WeatherList? day1,
    final WeatherList? day2,
    final WeatherList? day3,
    final WeatherList? day4,
    final WeatherList? day5,
    final String? cityName,
    String? errorMsg
  }) {
    return WeatherForecastState(
        status: status ?? this.status,
        day1: day1 ?? this.day1,
        day2: day2 ?? this.day2,
        day3: day3 ?? this.day3,
        day4: day4 ?? this.day4,
        day5: day5 ?? this.day5,
        cityName: cityName ?? this.cityName,
        errorMsg: errorMsg
    );
  }

  @override
  String toString() {
    return 'WeatherForecastState{status: $status, day1: $day1, day2: $day2, day3: $day3, day4: $day4, day5: $day5, cityName: $cityName, errorMsg: $errorMsg}';
  }

  @override
  List<Object?> get props => [status, day1, day2, day3, day4, day5, cityName, errorMsg,];
}
