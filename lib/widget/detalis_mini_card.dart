import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetalisMiniCard extends StatelessWidget {
  const DetalisMiniCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: SizedBox(
          child: Column(
            children: [
              Icon(
                Icons.add,
              ),
              Text('data'),
              Text('29')
            ],
          ),
        ),
      ),
    );
  }
}
