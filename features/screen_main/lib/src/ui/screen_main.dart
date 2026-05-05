import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'widgets/screen_main_widgets.dart';

@RoutePage()
class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {

          },
          child: const Text(
            'FI',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              //color:,
            ),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          //color:,
          onPressed: () {
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            //color:,
            onPressed: () {
            },
          ),
        ],
      ),
      body:
      SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: 20),

            ScreenMainCalendar(),

            SizedBox(height: 20),

            ScreenMainTrainingReport(),

            SizedBox(height: 20),

            ScreenMainTrainingScroll(),
            SizedBox(height: 20),

            ScreenMainNutritionReport(),

            SizedBox(height: 200),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Упражнения',

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Тренировки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Знания',
            ),
        ],
      ),
    );
  }
}