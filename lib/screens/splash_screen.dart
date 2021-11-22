import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api_provider.dart';
import 'package:weather_app/constants/style_constants.dart';
import 'package:weather_app/models/daily_weatherforecast_model.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/utilities/location.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future<WeatherForecast> forecastObject;
  late double longitude = 30.5199329203;
  late double latitude = 50.4333949331;

  @override
  void initState() {
    super.initState();

    forecastObject = WeatherApiProvider().fetchWeatherForecastWithCity(
        lon: longitude.toString(), lat: latitude.toString());

    getLocation();
    _navigateToHome();
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();

    longitude = location.longitude;
    latitude = location.latitude;
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {
      forecastObject = WeatherApiProvider().fetchWeatherForecastWithCity(
          lon: longitude.toString(), lat: latitude.toString());
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          forecastObject: forecastObject,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customGradientBackground,
        child: Center(
          child: Image.asset('assets/weather_icon.png'),
        ),
      ),
    );
  }
}
