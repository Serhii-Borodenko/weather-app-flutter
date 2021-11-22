import 'dart:convert';
import 'package:weather_app/constants/api_constans.dart';
import 'package:weather_app/models/daily_weatherforecast_model.dart';
import 'package:http/http.dart' as http;

class WeatherApiProvider {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {required String lon, required String lat}) async {
    var queryParameters = {
      'lat': lat,
      'lon': lon,
      'appid': Constants.WEATHER_APP_ID,
      'units': 'metric',
    };
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
