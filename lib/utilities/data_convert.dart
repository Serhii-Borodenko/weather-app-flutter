import 'package:intl/intl.dart';

class DataConvert {
  String getFormattedData(DateTime dataTime) =>
      DateFormat('EEE, MMM d, y').format(dataTime);

  String getFormattedDataDailyForecast(DateTime dataTime) =>
      DateFormat('EEE, MMM d').format(dataTime);
}
