import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/style_constants.dart';
import 'package:weather_app/models/daily_weatherforecast_model.dart';
import 'package:weather_app/modules/listview_widget.dart';
import 'package:weather_app/modules/main_widget.dart';
import 'package:weather_app/modules/settings_icon_button.dart';
import 'package:weather_app/screens/splash_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.forecastObject}) : super(key: key);
  Future<WeatherForecast> forecastObject;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String dropdownValue = 'Daily forecast';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: customGradientBackground,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(canvasColor: Colors.blue.shade200),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(
                        Icons.arrow_downward,
                        color: Colors.white,
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(fontSize: 21.0),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Daily forecast', 'Hourly forecast']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SettingsIconButton()
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: FutureBuilder<WeatherForecast>(
              future: widget.forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: MainWidget(
                          snapshot: snapshot,
                        ),
                      ),
                      (dropdownValue == 'Daily forecast')
                          ? ListViewWidgetDaily(snapshot: snapshot)
                          : ListViewWidgetHourly(snapshot: snapshot)
                    ],
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
