import 'package:flutter/material.dart';
import 'package:screen_main/src/ui/widgets/screen_main_widgets.dart';

class ScreenMainTrainingScroll extends StatelessWidget {
  const ScreenMainTrainingScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: Text(
            'Твои тренировки',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 100, // Добавлена фиксированная высота
          child: SingleChildScrollView(
            // Исправлено: ScrollView -> SingleChildScrollView
            scrollDirection: Axis.horizontal, // Горизонтальная прокрутка
            child: Row(
              children: List.generate(
                30,
                (index) => // Генерируем 30 квадратов через цикл
                Row(
                  children: [
                    Container(
                      color: Colors.lightBlueAccent,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        ScreenMainAverageValue(title: 'Любимая тренировка:', value: 'Грудные'),
      ],
    );
  }
}
