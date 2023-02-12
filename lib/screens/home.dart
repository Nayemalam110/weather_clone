import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:weather/service/service.dart';
import 'package:weather/widget/temp_by_hour.dart';
import 'package:weather/widget/weather_by_day.dart';
import 'package:weather/widget/weather_detalis.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  WeatherController weatherController =
      Get.put(WeatherController(), permanent: true);
  @override
  void initState() {
    weatherController.featchWeatherData();
    // TODO: implement initState
    super.initState();
  }

  String getCurrentData() {
    if (weatherController.weathedata.value.current != null) {
      var date = DateTime.fromMillisecondsSinceEpoch(
          (weatherController.weathedata.value.current!.dt! as int) * 1000);

      var maxTemp = weatherController.weathedata.value.daily![0].temp!.max!
          .toStringAsFixed(0);

      var minTemp = weatherController.weathedata.value.daily![0].temp!.min!
          .toStringAsFixed(0);
      // var max = DateTime.fromMillisecondsSinceEpoch(
      //     (weatherController.weathedata.value.current!.sunrise as int) * 1000);
      // var min = DateTime.fromMillisecondsSinceEpoch(
      //     weatherController.weathedata.value.current!.sunset as int);
      var dayMaxMin = "${DateFormat('E').format(date)} $maxTemp/$minTemp";

      return dayMaxMin;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //  snap: false,
          pinned: true,
          floating: true,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Obx(() => Text(weatherController.areaName.value,
                            style: TextStyle(
                              color: Colors.white,
                              //fontSize: 10.0,
                            )) //TextStyle
                        ),
                  ),
                ],
              ), //Text
              background: Image.asset(
                  'assets/images/black_background.png') //Images.network
              ), //FlexibleSpaceBar
          expandedHeight: 200,
          backgroundColor: Colors.black,
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: 'Menu',
          //   onPressed: () {},
          // ), //IconButton
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
        ), //SliverAppBar
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Obx(
                () => weatherController.weathedata.value.lat == null
                    ? SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Text(weatherController
                                          .weathedata.value.current!.temp ==
                                      null
                                  ? ''
                                  : weatherController
                                      .weathedata.value.current!.temp!
                                      .toStringAsFixed(0)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(weatherController.weathedata.value.current!
                                      .weather![0].main ??
                                  ''),
                            ],
                          ),
                          Text(getCurrentData()),
                          TempByHour(),
                          WeatherByDay(),
                          SizedBox(
                              width: double.infinity, child: WeatherDetalis())
                        ],
                      ),
              ),
            ), //ListTile
            childCount: 1,
          ), //SliverChildBuildDelegate
        ),

        //SliverList
      ], //<Widget>[]
    ));
  }
}
