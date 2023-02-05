import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WeatherByDay extends StatelessWidget {
  const WeatherByDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
            Row(
              children: [
                Text('Monday '),
                SizedBox(
                  width: 30,
                ),
                Icon(Icons.wallet),
                Text('Sunny'),
                Text('20/28')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
