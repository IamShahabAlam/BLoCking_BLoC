part of 'weather_bloc.dart';

class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherData;
  WeatherSuccess({required this.weatherData});
}

class WeatherFailure extends WeatherState {
  final String message;
  WeatherFailure(this.message);
}
