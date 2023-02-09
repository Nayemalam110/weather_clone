import 'package:get/get.dart';
import 'package:weather/api/api_key.dart';
import 'package:http/http.dart' as http;
import 'package:weather/model/weatherModel.dart';

class WeatherController extends GetxController {
  Rx<WeatherModel> weathedata = WeatherModel().obs;

  Future<void> featchWeatherData() async {
    final response = await http.get(Uri.parse(apiURL(23.811056, 90.407608)),
        headers: {'Accept': 'application/json'});

    if (response.statusCode == 200 || response.statusCode == 201) {
      // final user = json.decode(response.body);
      weathedata.value = WeatherModelFromJson(response.body);
      print(weathedata.value.lat);

      //print(user);
    } else {
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
