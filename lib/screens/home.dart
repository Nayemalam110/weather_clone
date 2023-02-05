import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weather/widget/temp_by_hour.dart';
import 'package:weather/widget/weather_by_day.dart';
import 'package:weather/widget/weather_detalis.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                    child: Text("Banani model town",
                        style: TextStyle(
                          color: Colors.white,
                          //fontSize: 10.0,
                        ) //TextStyle
                        ),
                  ),
                ],
              ), //Text
              background: Image.network(
                "https://i.ibb.co/QpWGK5j/Geeksfor-Geeks.png",
                fit: BoxFit.cover,
              ) //Images.network
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text('22°C'),
                      Text('Haze'),
                    ],
                  ),
                  Text('sat27/16'),
                  TempByHour(),
                  WeatherByDay(),
                  WeatherDetalis()
                ],
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
