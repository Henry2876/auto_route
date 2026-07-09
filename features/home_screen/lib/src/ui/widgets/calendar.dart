import 'package:flutter/material.dart';
import 'widgets.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'Твой график тренировок',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          color: Colors.lightBlueAccent,
          width: 600,
          height: 300,
          padding: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          child: Text(
            'Calendar',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        SizedBox(height: 10),
        AverageValue(title: 'Тренировок за неделю:', value: '3 раза'),
      ],
    );
  }
}
