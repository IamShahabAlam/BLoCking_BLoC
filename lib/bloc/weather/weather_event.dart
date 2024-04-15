part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class FetchWeatherData extends WeatherEvent {
  final String? cityName;

  FetchWeatherData({this.cityName});
}
