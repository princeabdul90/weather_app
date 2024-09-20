import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather/domain_model/domain_model.dart';
import 'package:weather/repository/weather_repository.dart';

part 'weather_forecast_event.dart';
part 'weather_forecast_state.dart';

class WeatherForecastBloc
    extends Bloc<WeatherForecastEvent, WeatherForecastState> {
  final WeatherRepository weatherRepository;

  WeatherForecastBloc({required this.weatherRepository})
      : super(WeatherForecastState.initial()) {
    on<SearchCityForecastEvent>(_getWeatherForecast);
  }

  void _getWeatherForecast(
      SearchCityForecastEvent event, Emitter<WeatherForecastState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final data = await weatherRepository.getWeather(city: event.city);

      final dateFormatter = DateFormat('yyyy-MM-dd');
      final timeFormatter = DateFormat('HH:mm:ss');

      /// get datetime for 5 days
      DateTime day1 = DateTime.now();
      DateTime day2 = day1.add(const Duration(days: 1));
      DateTime day3 = day1.add(const Duration(days: 2));
      DateTime day4 = day1.add(const Duration(days: 3));
      DateTime day5 = day1.add(const Duration(days: 4));

      /// format datetime to get only date for the 5 days
      final formattedDate1 = dateFormatter.format(day1);
      final formattedDate2 = dateFormatter.format(day2);
      final formattedDate3 = dateFormatter.format(day3);
      final formattedDate4 = dateFormatter.format(day4);
      final formattedDate5 = dateFormatter.format(day5);

      /// format datetime to get only corresponding current time for the 5 days
      final formattedTime = timeFormatter.format(day1);
      DateTime time1 = DateTime.parse("$formattedDate1 $formattedTime");
      DateTime time2 = DateTime.parse("$formattedDate2 $formattedTime");
      DateTime time3 = DateTime.parse("$formattedDate3 $formattedTime");
      DateTime time4 = DateTime.parse("$formattedDate4 $formattedTime");
      DateTime time5 = DateTime.parse("$formattedDate5 $formattedTime");

      /// filter the weather forecast data by datetime. Return only the one forecast for each day
      var day1List = data!.list!.where((dt) => dt.dtTxt!.isAfter(time1)).first;
      var day2List = data.list!.where((dt) => dt.dtTxt!.isAfter(time2)).first;
      var day3List = data.list!.where((dt) => dt.dtTxt!.isAfter(time3)).first;
      var day4List = data.list!.where((dt) => dt.dtTxt!.isAfter(time4)).first;
      var day5List = data.list!.where((dt) => dt.dtTxt!.isAfter(time5)).first;

      emit(state.copyWith(
          status: Status.success,
          day1: day1List,
          day2: day2List,
          day3: day3List,
          day4: day4List,
          day5: day5List,
        cityName: data.cityName
      ));
      // print("Weather State: $state\n");
    } catch (error) {
      if (error is WeatherErrorException) {
        emit(state.copyWith(
            status: Status.error, errorMsg: 'Nothing to search'));
      }
    }
  }
}
