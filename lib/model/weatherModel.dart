// To parse this JSON data, do
//
//     final WeatherModel = WeatherModelFromJson(jsonString);

import 'dart:convert';

WeatherModel WeatherModelFromJson(String str) =>
    WeatherModel.fromJson(json.decode(str));

String WeatherModelToJson(WeatherModel data) => json.encode(data.toJson());

class WeatherModel {
  WeatherModel({
    this.lat,
    this.lon,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.hourly,
    this.daily,
  });

  double? lat;
  double? lon;
  String? timezone;
  int? timezoneOffset;
  Current? current;
  List<Current>? hourly;
  List<Daily>? daily;

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current:
            json["current"] == null ? null : Current.fromJson(json["current"]),
        hourly: json["hourly"] == null
            ? []
            : List<Current>.from(
                json["hourly"]!.map((x) => Current.fromJson(x))),
        daily: json["daily"] == null
            ? []
            : List<Daily>.from(json["daily"]!.map((x) => Daily.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current?.toJson(),
        "hourly": hourly == null
            ? []
            : List<dynamic>.from(hourly!.map((x) => x.toJson())),
        "daily": daily == null
            ? []
            : List<dynamic>.from(daily!.map((x) => x.toJson())),
      };
}

class Current {
  Current({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.uvi,
    this.clouds,
    this.visibility,
    this.windSpeed,
    this.windDeg,
    this.weather,
    this.windGust,
    this.pop,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? uvi;
  int? clouds;
  int? visibility;
  double? windSpeed;
  int? windDeg;
  List<Weather>? weather;
  double? windGust;
  int? pop;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        uvi: json["uvi"]?.toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        windGust: json["wind_gust"]?.toDouble(),
        pop: json["pop"],
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "wind_gust": windGust,
        "pop": pop,
      };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int? id;
  Main? main;
  Description? description;
  Icon? icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: mainValues.map[json["main"]]!,
        description: descriptionValues.map[json["description"]]!,
        icon: iconValues.map[json["icon"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": iconValues.reverse[icon],
      };
}

enum Description { HAZE, CLEAR_SKY, SCATTERED_CLOUDS }

final descriptionValues = EnumValues({
  "clear sky": Description.CLEAR_SKY,
  "haze": Description.HAZE,
  "scattered clouds": Description.SCATTERED_CLOUDS
});

enum Icon { THE_50_D, THE_01_D, THE_03_D, THE_01_N }

final iconValues = EnumValues({
  "01d": Icon.THE_01_D,
  "01n": Icon.THE_01_N,
  "03d": Icon.THE_03_D,
  "50d": Icon.THE_50_D
});

enum Main { HAZE, CLEAR, CLOUDS }

final mainValues =
    EnumValues({"Clear": Main.CLEAR, "Clouds": Main.CLOUDS, "Haze": Main.HAZE});

class Daily {
  Daily({
    this.dt,
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.windSpeed,
    this.windDeg,
    this.windGust,
    this.weather,
    this.clouds,
    this.pop,
    this.uvi,
  });

  int? dt;
  int? sunrise;
  int? sunset;
  int? moonrise;
  int? moonset;
  double? moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int? pressure;
  int? humidity;
  double? dewPoint;
  double? windSpeed;
  int? windDeg;
  double? windGust;
  List<Weather>? weather;
  int? clouds;
  int? pop;
  double? uvi;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase: json["moon_phase"]?.toDouble(),
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint: json["dew_point"]?.toDouble(),
        windSpeed: json["wind_speed"]?.toDouble(),
        windDeg: json["wind_deg"],
        windGust: json["wind_gust"]?.toDouble(),
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        clouds: json["clouds"],
        pop: json["pop"],
        uvi: json["uvi"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "clouds": clouds,
        "pop": pop,
        "uvi": uvi,
      };
}

class FeelsLike {
  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? night;
  double? eve;
  double? morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Temp {
  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  double? day;
  double? min;
  double? max;
  double? night;
  double? eve;
  double? morn;

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
