import 'package:flutter/material.dart';

class NutritionReport extends StatelessWidget {
  const NutritionReport({super.key});

  @override
  Widget build(BuildContext context) {
    return buildNutritionReport();
  }
}

// Отчет по питанию
Widget buildNutritionReport() {
  // Данные по дням недели и калориям
  final List<NutritionData> nutritionData = [
    NutritionData(day: 'Пн', calories: 2500),
    NutritionData(day: 'Вт', calories: 1800),
    NutritionData(day: 'Ср', calories: 3200),
    NutritionData(day: 'Чт', calories: 2800),
    NutritionData(day: 'Пт', calories: 3500),
    NutritionData(day: 'Сб', calories: 4200),
    NutritionData(day: 'Вс', calories: 2100),
  ];

  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Заголовок
        const Text(
          'Отчет по питанию',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),

        // Шкала калорий (от 500 до 4500)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('500', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('1500', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('2500', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('3500', style: TextStyle(fontSize: 10, color: Colors.grey)),
              Text('4500', style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // График калорий по дням
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: nutritionData.map((data) {
            return _buildNutritionBar(data);
          }).toList(),
        ),

        const SizedBox(height: 12),

        // Подписи дней недели
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: nutritionData.map((data) {
            return SizedBox(
              width: 30,
              child: Text(
                data.day,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 16),

        // Среднее значение калорий
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.lightBlue.shade200),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Среднее за неделю:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              Text(
                '${(nutritionData.map((e) => e.calories).reduce((a, b) => a + b) / nutritionData.length).toInt()} ккал',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Виджет столбца калорий
Widget _buildNutritionBar(NutritionData data) {
  // Максимальное значение калорий 4500, минимальное 500
  final maxCalories = 4500;
  final minHeight = 20.0; // Минимальная высота столбца
  final maxHeight = 150.0; // Максимальная высота столбца

  // Расчет высоты столбца (нормализация от 0 до 1)
  double heightFactor = (data.calories - 500) / (maxCalories - 500);
  heightFactor = heightFactor.clamp(0.0, 1.0);
  double barHeight = minHeight + (maxHeight - minHeight) * heightFactor;

  // Цвет столбца в зависимости от калорий
  Color barColor;
  if (data.calories < 2000) {
    barColor = Colors.green; // Недостаточно калорий
  } else if (data.calories < 3000) {
    barColor = Colors.lightBlue; // Норма
  } else if (data.calories < 4000) {
    barColor = Colors.orange; // Много калорий
  } else {
    barColor = Colors.red; // Перебор
  }

  return Column(
    children: [
      // Значение калорий над столбцом
      Text(
        '${data.calories}',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: barColor,
        ),
      ),
      const SizedBox(height: 4),

      // Столбец
      Container(
        width: 30,
        height: barHeight,
        decoration: BoxDecoration(
          color: barColor,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ],
  );
}

// Класс данных для питания
class NutritionData {
  final String day;
  final int calories;

  NutritionData({required this.day, required this.calories});
}
