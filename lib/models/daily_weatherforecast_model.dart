import 'package:weather_app/constants/api_constans.dart';

class WeatherForecast {
  WeatherForecast({
    required this.city,
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });
  late final City city;
  late final String cod;
  late final double message;
  late final int cnt;
  late final List<WeatherList> list;

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    city = City.fromJson(json['city']);
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    list = List.from(json['list']).map((e) => WeatherList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city'] = city.toJson();
    _data['cod'] = cod;
    _data['message'] = message;
    _data['cnt'] = cnt;
    _data['list'] = list.map((e) => e.toJson()).toList();
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });
  late final int id;
  late final String name;
  late final Coord coord;
  late final String country;
  late final int population;
  late final int timezone;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['coord'] = coord.toJson();
    _data['country'] = country;
    _data['population'] = population;
    _data['timezone'] = timezone;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lon,
    required this.lat,
  });
  late final double lon;
  late final double lat;

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lon'] = lon;
    _data['lat'] = lat;
    return _data;
  }
}

class WeatherList {
  WeatherList({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
  });
  late final int dt;
  late final int sunrise;
  late final int sunset;
  late final Temp temp;
  late final FeelsLike feelsLike;
  late final int pressure;
  late final int humidity;
  late final List<Weather> weather;
  late final double speed;
  late final int deg;
  late final double gust;
  late final int clouds;
  late final double pop;

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = Temp.fromJson(json['temp']);
    feelsLike = FeelsLike.fromJson(json['feels_like']);
    pressure = json['pressure'];
    humidity = json['humidity'];
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    speed = json['speed'].toDouble();
    deg = json['deg'];
    gust = json['gust'].toDouble();
    clouds = json['clouds'];
    pop = json['pop'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    _data['temp'] = temp.toJson();
    _data['feels_like'] = feelsLike.toJson();
    _data['pressure'] = pressure;
    _data['humidity'] = humidity;
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['speed'] = speed;
    _data['deg'] = deg;
    _data['gust'] = gust;
    _data['clouds'] = clouds;
    _data['pop'] = pop;
    return _data;
  }

  String getIconUrl() {
    return Constants.WEATHER_IMAGES_URL + weather[0].icon + '.png';
  }
}

class Temp {
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final double day;
  late final double min;
  late final double max;
  late final double night;
  late final double eve;
  late final double morn;

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    min = json['min'].toDouble();
    max = json['max'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['min'] = min;
    _data['max'] = max;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}

class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });
  late final double day;
  late final double night;
  late final double eve;
  late final double morn;

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['night'] = night;
    _data['eve'] = eve;
    _data['morn'] = morn;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}
