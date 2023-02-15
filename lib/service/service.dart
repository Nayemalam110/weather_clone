import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weatherModel.dart';
import 'package:geocoding/geocoding.dart';

class WeatherController extends GetxController {
  Rx<WeatherModel> weathedata = WeatherModel().obs;
  var areaName = ''.obs;

  feachLocationName(lat, lang) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lang);
    areaName.value = placemarks[0].locality ?? '';
  }

  Future<void> featchWeatherData({lat = 23.811056, lang = 90.407608}) async {
    final response = await http.get(Uri.parse(apiURL(lat, lang)),
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      // final user = json.decode(response.body);
      weathedata.value = WeatherModelFromJson(response.body);
      feachLocationName(lat, lang);
      print(weathedata.value.lat);

      //print(user);
    } else {
      Get.defaultDialog(
          title: 'Erro',
          content: const Center(
            child: Text('There is an error'),
          ),
          cancel: InkWell(
              onTap: () => exit(0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Close'),
              )),
          onCancel: () {
            Get.back();
          });

      print('Request failed with status code: ${response.statusCode}');
    }
  }

  String apiURL(lat, lon) {
    String url;
    url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$lon&appid=$apiKey&units=metric&exclude=minutely";

    return url;
  }
}
