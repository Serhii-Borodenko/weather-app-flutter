import 'package:flutter/material.dart';
import 'package:weather_app/constants/style_constants.dart';
import 'package:weather_app/models/daily_weatherforecast_model.dart';
import 'package:weather_app/utilities/data_convert.dart';

class MainWidget extends StatelessWidget {
  MainWidget({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var cityName = snapshot.data!.city.name;
    var countryName = snapshot.data!.city.country;
    var icon = forecastList[0].getIconUrl();
    var temp = forecastList[0].temp.day.toStringAsFixed(0);
    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: widgetsContainerStyle,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  icon,
                  scale: 0.6,
                ),
                const SizedBox(width: 5.0),
                Text(
                  '$temp',
                  style: TextStyle(fontSize: 70.0),
                ),
                Column(
                  children: const [
                    Text(
                      '°C',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ],
            ),
            Text('$cityName,$countryName'),
            Text('${DataConvert().getFormattedData(formatedDate)}'),
          ],
        ),
      ),
    );
  }
}
