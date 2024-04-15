import 'dart:convert';

import 'package:bloc_app/data/data_provider/weather_data_provider.dart';
import 'package:bloc_app/model/weather_model.dart';
import 'package:bloc_app/utils/app_strings.dart';

class WeatherRepo {
  final weatherDataProvider = WeatherDataProvider();

  Future<WeatherModel> getWeatherData(String cityName) async {
    try {
      final responseString = await weatherDataProvider.getWeatherData(cityName);
      final responseBody = jsonDecode(responseString);

      if (responseBody['cod'] != '200') {
        throw AppStrings.errorMsg;
      }

      return WeatherModel.fromJson(responseBody);
    } catch (e) {
      throw e.toString();
    }
  }
}
