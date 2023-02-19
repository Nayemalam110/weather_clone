import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/service/service.dart';

class WeatherByDay extends StatelessWidget {
  WeatherByDay({super.key});
  WeatherController weatherController = Get.find();
  String getDay(time) {
    if (time == '') {
      return '';
    } else {
      var hour = DateTime.fromMillisecondsSinceEpoch((time as int) * 1000);
      print(hour);
      var h = DateFormat('EEEE').format(hour);
      return h;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      //clipBehavior: Clip.hardEdge,
      color: Colors.red, elevation: 3,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 7,
            //   physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => Row(
              children: [
                Expanded(
                    flex: 3,
                    child: index == 0
                        ? const Text('Today ')
                        : Text(getDay(weatherController
                            .weathedata.value.daily![index].dt))),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          width: 50,
                          child: weatherController.weathedata.value
                                      .daily![index].weather![0].main ==
                                  'Clear'
                              ? const Text('Sunny')
                              : Text(
                                  '${weatherController.weathedata.value.daily![index].weather![0].main}')),
                      Text(
                          '${weatherController.weathedata.value.daily![index].temp!.min!.toStringAsFixed(0)}/${weatherController.weathedata.value.daily![index].temp!.max!.toStringAsFixed(0)}')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
