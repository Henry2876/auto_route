import 'package:flutter/material.dart';
import 'package:home_screen/src/ui/widgets/widgets_home_screen.dart';


class TrainingReportHomeScreen extends StatelessWidget {
  const TrainingReportHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildMuscleReportChart();}


  Widget buildMuscleReportChart() {
    // Данные для графика
    final List<MuscleData> muscles = [
      MuscleData(name: 'Ноги', percentage: 91),
      MuscleData(name: 'Руки', percentage: 70),
      MuscleData(name: 'Спина', percentage: 85),
      MuscleData(name: 'Пресс', percentage: 40),
      MuscleData(name: 'Грудь', percentage: 75),
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Заголовок
          const Text(
            'Отчеты по мышцам',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),

          // График
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Шкала подходов (слева)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    SizedBox(height: 30),
                    Text(
                      '91%',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    SizedBox(height: 40),
                    Text(
                      '70-80%',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    SizedBox(height: 55),
                    Text(
                      '40-50%',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    SizedBox(height: 70),
                    Text(
                      '0%',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ],
                ),

                const SizedBox(width: 10),

                // Столбцы для каждой мышцы
                Row(
                  children: muscles.map((muscle) {
                    return buildMuscleBar(muscle);
                  }).toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          AverageValueHomeScreen(title: 'Усталость мышц за неделю:', value: '70%'),
        ],
      ),
    );
  }
}

// Виджет отдельного столбца мышцы
Widget buildMuscleBar(MuscleData muscle) {
  return Container(
    width: 60,
    margin: const EdgeInsets.symmetric(horizontal: 4),
    child: Column(
      children: [
        // Процент над столбцом
        Text(
          '${muscle.percentage}%',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.lightBlueAccent,
          ),
        ),
        const SizedBox(height: 4),

        // Столбец
        Container(
          height: 150, // Максимальная высота столбца
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 40,
            height: 150 * (muscle.percentage / 100),
            // Высота в зависимости от процента
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Название мышцы
        Text(
          muscle.name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

// Класс данных для мышц
class MuscleData {
  final String name;
  final int percentage;

  MuscleData({required this.name, required this.percentage});
}