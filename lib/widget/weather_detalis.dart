import 'package:flutter/material.dart';
import 'package:weather/widget/detalis_mini_card.dart';

class WeatherDetalis extends StatelessWidget {
  const WeatherDetalis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            DetalisMiniCard(),
            DetalisMiniCard(),
          ],
        ),
        Row(
          children: [
            DetalisMiniCard(),
            DetalisMiniCard(),
          ],
        ),
        Row(
          children: [
            DetalisMiniCard(),
            DetalisMiniCard(),
          ],
        ),
        Row(
          children: [
            DetalisMiniCard(),
            DetalisMiniCard(),
          ],
        ),
        DetalisMiniCard(),
        DetalisMiniCard(),
        DetalisMiniCard(),
        DetalisMiniCard(),
      ],
    );
  }
}
