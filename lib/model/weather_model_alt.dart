// To parse this JSON data, do
//
//     final weatherModelAlt = weatherModelAltFromJson(jsonString);

import 'dart:convert';

WeatherModelAlt weatherModelAltFromJson(String str) =>
    WeatherModelAlt.fromJson(json.decode(str));

String weatherModelAltToJson(WeatherModelAlt data) =>
    json.encode(data.toJson());

class WeatherModelAlt {
  WeatherModelAlt({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentWeather,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });

  double? latitude;
  double? longitude;
  double? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  CurrentWeather? currentWeather;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  factory WeatherModelAlt.fromJson(Map<String, dynamic> json) =>
      WeatherModelAlt(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        generationtimeMs: json["generationtime_ms"]?.toDouble(),
        utcOffsetSeconds: json["utc_offset_seconds"],
        timezone: json["timezone"],
        timezoneAbbreviation: json["timezone_abbreviation"],
        elevation: json["elevation"],
        currentWeather: json["current_weather"] == null
            ? null
            : CurrentWeather.fromJson(json["current_weather"]),
        hourlyUnits: json["hourly_units"] == null
            ? null
            : HourlyUnits.fromJson(json["hourly_units"]),
        hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
        dailyUnits: json["daily_units"] == null
            ? null
            : DailyUnits.fromJson(json["daily_units"]),
        daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "generationtime_ms": generationtimeMs,
        "utc_offset_seconds": utcOffsetSeconds,
        "timezone": timezone,
        "timezone_abbreviation": timezoneAbbreviation,
        "elevation": elevation,
        "current_weather": currentWeather?.toJson(),
        "hourly_units": hourlyUnits?.toJson(),
        "hourly": hourly?.toJson(),
        "daily_units": dailyUnits?.toJson(),
        "daily": daily?.toJson(),
      };
}

class CurrentWeather {
  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.weathercode,
    this.time,
  });

  double? temperature;
  double? windspeed;
  num? winddirection;
  num? weathercode;
  String? time;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"]?.toDouble(),
        winddirection: json["winddirection"],
        weathercode: json["weathercode"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "temperature": temperature,
        "windspeed": windspeed,
        "winddirection": winddirection,
        "weathercode": weathercode,
        "time": time,
      };
}

class Daily {
  Daily({
    this.time,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.sunrise,
    this.sunset,
  });

  List<DateTime>? time;
  List<double>? temperature2MMax;
  List<double>? temperature2MMin;
  List<double>? apparentTemperatureMax;
  List<String>? sunrise;
  List<String>? sunset;

  factory Daily.fromJson(Map<String, dynamic> json) => Daily(
        time: json["time"] == null
            ? []
            : List<DateTime>.from(json["time"]!.map((x) => DateTime.parse(x))),
        temperature2MMax: json["temperature_2m_max"] == null
            ? []
            : List<double>.from(
                json["temperature_2m_max"]!.map((x) => x?.toDouble())),
        temperature2MMin: json["temperature_2m_min"] == null
            ? []
            : List<double>.from(
                json["temperature_2m_min"]!.map((x) => x?.toDouble())),
        apparentTemperatureMax: json["apparent_temperature_max"] == null
            ? []
            : List<double>.from(
                json["apparent_temperature_max"]!.map((x) => x?.toDouble())),
        sunrise: json["sunrise"] == null
            ? []
            : List<String>.from(json["sunrise"]!.map((x) => x)),
        sunset: json["sunset"] == null
            ? []
            : List<String>.from(json["sunset"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null
            ? []
            : List<dynamic>.from(time!.map((x) =>
                "${x.year.toString().padLeft(4, '0')}-${x.month.toString().padLeft(2, '0')}-${x.day.toString().padLeft(2, '0')}")),
        "temperature_2m_max": temperature2MMax == null
            ? []
            : List<dynamic>.from(temperature2MMax!.map((x) => x)),
        "temperature_2m_min": temperature2MMin == null
            ? []
            : List<dynamic>.from(temperature2MMin!.map((x) => x)),
        "apparent_temperature_max": apparentTemperatureMax == null
            ? []
            : List<dynamic>.from(apparentTemperatureMax!.map((x) => x)),
        "sunrise":
            sunrise == null ? [] : List<dynamic>.from(sunrise!.map((x) => x)),
        "sunset":
            sunset == null ? [] : List<dynamic>.from(sunset!.map((x) => x)),
      };
}

class DailyUnits {
  DailyUnits({
    this.time,
    this.temperature2MMax,
    this.temperature2MMin,
    this.apparentTemperatureMax,
    this.sunrise,
    this.sunset,
  });

  String? time;
  String? temperature2MMax;
  String? temperature2MMin;
  String? apparentTemperatureMax;
  String? sunrise;
  String? sunset;

  factory DailyUnits.fromJson(Map<String, dynamic> json) => DailyUnits(
        time: json["time"],
        temperature2MMax: json["temperature_2m_max"],
        temperature2MMin: json["temperature_2m_min"],
        apparentTemperatureMax: json["apparent_temperature_max"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m_max": temperature2MMax,
        "temperature_2m_min": temperature2MMin,
        "apparent_temperature_max": apparentTemperatureMax,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Hourly {
  Hourly({
    this.time,
    this.temperature2M,
    this.surfacePressure,
    this.visibility,
  });

  List<String>? time;
  List<double>? temperature2M;
  List<double>? surfacePressure;
  List<num>? visibility;

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: json["time"] == null
            ? []
            : List<String>.from(json["time"]!.map((x) => x)),
        temperature2M: json["temperature_2m"] == null
            ? []
            : List<double>.from(
                json["temperature_2m"]!.map((x) => x?.toDouble())),
        surfacePressure: json["surface_pressure"] == null
            ? []
            : List<double>.from(
                json["surface_pressure"]!.map((x) => x?.toDouble())),
        visibility: json["visibility"] == null
            ? []
            : List<num>.from(json["visibility"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null ? [] : List<dynamic>.from(time!.map((x) => x)),
        "temperature_2m": temperature2M == null
            ? []
            : List<dynamic>.from(temperature2M!.map((x) => x)),
        "surface_pressure": surfacePressure == null
            ? []
            : List<dynamic>.from(surfacePressure!.map((x) => x)),
        "visibility": visibility == null
            ? []
            : List<dynamic>.from(visibility!.map((x) => x)),
      };
}

class HourlyUnits {
  HourlyUnits({
    this.time,
    this.temperature2M,
    this.surfacePressure,
    this.visibility,
  });

  String? time;
  String? temperature2M;
  String? surfacePressure;
  String? visibility;

  factory HourlyUnits.fromJson(Map<String, dynamic> json) => HourlyUnits(
        time: json["time"],
        temperature2M: json["temperature_2m"],
        surfacePressure: json["surface_pressure"],
        visibility: json["visibility"],
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "temperature_2m": temperature2M,
        "surface_pressure": surfacePressure,
        "visibility": visibility,
      };
}
