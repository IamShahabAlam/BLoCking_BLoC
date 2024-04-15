import 'package:bloc_app/utils/app_strings.dart';
import 'package:http/http.dart' as http;

class WeatherDataProvider {
  Future<String> getWeatherData(String cityName) async {
    try {
      final resp = await http.get(Uri.parse('${AppStrings.weatherEndpoint}?q=$cityName&APPID=${AppStrings.weatherApiKey}'));

      if (resp.statusCode == 200) {
        return resp.body;
      }
      throw AppStrings.errorMsg;
    } catch (e) {
      throw e.toString();
    }
  }
}
