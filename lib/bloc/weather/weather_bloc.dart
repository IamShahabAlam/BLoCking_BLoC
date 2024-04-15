import 'package:bloc_app/model/weather_model.dart';
import 'package:bloc_app/repository/weather_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherState()) {
    on<FetchWeatherData>(_fetchWeatherData);
  }

  Future<void> _fetchWeatherData(FetchWeatherData event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weatherRepo = WeatherRepo();

      WeatherModel data = await weatherRepo.getWeatherData(event.cityName ?? 'Karachi');
      emit(WeatherSuccess(weatherData: data));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
