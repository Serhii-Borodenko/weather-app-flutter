import 'package:flutter/material.dart';
import 'package:weather_app/constants/style_constants.dart';
import 'package:weather_app/models/daily_weatherforecast_model.dart';
import 'package:weather_app/utilities/data_convert.dart';

class ListViewWidgetDaily extends StatelessWidget {
  ListViewWidgetDaily({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;

    return Expanded(
      flex: 2,
      child: ListView.builder(
        itemCount: forecastList.length - 1,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: widgetsContainerStyle,
            child: ListTile(
              leading: Text(
                DataConvert().getFormattedDataDailyForecast(
                    DateTime.fromMillisecondsSinceEpoch(
                        forecastList[1 + index].dt * 1000)),
                style: const TextStyle(fontSize: 20.0),
              ),
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${forecastList[1 + index].temp.day.toStringAsFixed(0)}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Column(
                      children: const [
                        Text(
                          '°C',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
              trailing: Image.network(
                forecastList[1 + index].getIconUrl(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListViewWidgetHourly extends StatelessWidget {
  ListViewWidgetHourly({Key? key, required this.snapshot}) : super(key: key);
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var forecastListTemp = [
      snapshot.data!.list[0].temp.morn,
      snapshot.data!.list[0].temp.day,
      snapshot.data!.list[0].temp.eve,
      snapshot.data!.list[0].temp.night
    ];
    var forecastListFeelsLike = [
      snapshot.data!.list[0].feelsLike.morn,
      snapshot.data!.list[0].feelsLike.day,
      snapshot.data!.list[0].feelsLike.eve,
      snapshot.data!.list[0].feelsLike.night
    ];

    List<String> dayPart = ['morn', 'day', 'eve', 'night'];

    return Expanded(
      flex: 2,
      child: ListView.builder(
        itemCount: dayPart.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: widgetsContainerStyle,
            child: ListTile(
              leading:
                  Text(dayPart[index], style: const TextStyle(fontSize: 20.0)),
              title: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${forecastListTemp[index].toStringAsFixed(0)}',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Column(
                      children: const [
                        Text(
                          '°C',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    )
                  ],
                ),
              ),
              trailing: Text(
                  'Feels like ${forecastListFeelsLike[index].toStringAsFixed(0)} °C'),
            ),
          ),
        ),
      ),
    );
  }
}
