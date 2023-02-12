import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/service/service.dart';

class TempByHour extends StatelessWidget {
  TempByHour({
    Key? key,
  }) : super(key: key);

  WeatherController weatherController = Get.find();
  String getTime(time) {
    if (time == '') {
      return '';
    } else {
      var hour = DateTime.fromMillisecondsSinceEpoch((time as int) * 1000);
      print(hour);
      var h = DateFormat.jm().format(hour);
      return h;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 400,
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: weatherController.weathedata.value.hourly!.length > 15
            ? 15
            : weatherController.weathedata.value.hourly!.length,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              index == 0
                  ? Text('Now')
                  : Text(getTime(
                      weatherController.weathedata.value.hourly![index].dt)),
              Icon(Icons.add),
              Text(weatherController.weathedata.value.hourly![index].temp!
                  .toStringAsFixed(0)),
            ],
          ),
        ),
      ),
    );
  }
}
