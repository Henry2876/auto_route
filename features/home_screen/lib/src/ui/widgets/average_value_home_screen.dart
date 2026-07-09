import 'package:flutter/material.dart';

class AverageValueHomeScreen extends StatelessWidget {
  final String title;
  final String value;
  const AverageValueHomeScreen({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.lightBlue.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.lightBlueAccent,
            ),
          ),
        ],
      ),
    );
  }
}