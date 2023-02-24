import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weatherModel.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather/model/weather_model_alt.dart';
import 'package:weather/screens/alt_home.dart';

class WeatherController extends GetxController {
  Rx<WeatherModel> weathedata = WeatherModel().obs;
  Rx<WeatherModelAlt> weathedataAlt = WeatherModelAlt().obs;
  var areaName = ''.obs;

  feachLocationName(lat, lang) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    areaName.value = placemarks[0].locality ?? '';
  }

  Future<void> featchWeatherData({lat = 23.811056, lang = 90.407608}) async {
    feachLocationName(lat, lang);
    final response = await http.get(Uri.parse(apiURL(lat, lang)),
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      // final user = json.decode(response.body);
      weathedata.value = WeatherModelFromJson(response.body);

      print(weathedata.value.lat);

      //print(user);
    } else {
      altFetchWeatherData(lat: lat, lang: lang);

      print('Request failed with status code: ${response.statusCode}');
    }
  }

//altNet api
  Future<void> altFetchWeatherData({lat = 23.811056, lang = 90.407608}) async {
    try {
      final response = await http.get(Uri.parse(altApiURL(lat, lang)),
          headers: {'Accept': 'application/json'});

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final user = json.decode(response.body);
        weathedataAlt.value = weatherModelAltFromJson(response.body);

        //print(user);
      } else {
        Get.defaultDialog(
            title: 'Erro',
            content: const Center(
              child: Text('There is an error'),
            ),
            cancel: InkWell(
                onTap: () => exit(0),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Close'),
                )),
            onCancel: () {
              Get.back();
            });

        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    } finally {
      Get.off(() => AltHome());
    }
  }

  String apiURL(lat, lon) {
    String url;
    url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";

    return url;
  }

  String altApiURL(lat, lon) {
    String url;
    url =
        "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&hourly=temperature_2m,surface_pressure,visibility&daily=temperature_2m_max,temperature_2m_min,apparent_temperature_max,sunrise,sunset&current_weather=true&timezone=auto";

    return url;
  }

  
  Future<void> fetchDataAltDay(lat, long) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&APPID=010d8469f57ac9801d2f0a9d72e648fc');

    try {
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception();
      }

      final extertData = json.decode(response.body);

      var extertDatas = extertData['main'];
    } catch (e) {
      print('There is an error');
      print(e);
      throw e;
    } finally {
      _isLoading.value = false;
    }
  }
}
