import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/cubit/weather_state.dart';
import 'package:weather_app_bloc/data/weather_repository.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    emit(const WeatherLoading());

    try {
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError("Couldn't fetch weather. Is the device online?"));
    }
  }
}
