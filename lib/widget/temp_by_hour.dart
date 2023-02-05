import 'package:flutter/material.dart';

class TempByHour extends StatelessWidget {
  const TempByHour({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 400,
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 18,
        itemBuilder: (context, index) => Container(
          child: Column(
            children: [
              Text('22°C'),
              Icon(Icons.add),
              Text('22°C'),
            ],
          ),
        ),
      ),
    );
  }
}
