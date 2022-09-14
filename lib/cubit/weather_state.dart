import 'package:weather_app_bloc/data/model/weather.dart';

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial implements WeatherState {
  const WeatherInitial();
}

class WeatherLoading implements WeatherState {
  const WeatherLoading();
}

class WeatherLoaded implements WeatherState {
  final Weather weather;

  const WeatherLoaded(this.weather);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherLoaded && o.weather == weather;
  }

  @override
  int get hashCode => weather.hashCode;
}

class WeatherError implements WeatherState {
  final String message;

  const WeatherError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WeatherError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
