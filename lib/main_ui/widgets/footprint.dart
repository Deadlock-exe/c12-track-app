import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Footprint extends StatelessWidget {
  const Footprint({
    super.key,
    required this.title,
    required this.amount,
    required this.suggestion,
    required this.icon,
  });

  final String title;
  final double amount;
  final String suggestion;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF013030),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xFFFDFCE9),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      icon,
                      color: const Color(0xFFFDFCE9),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      amount.toString(),
                      style: const TextStyle(
                        color: Color(0xFFFDFCE9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    suggestion,
                    style: const TextStyle(
                      color: Color(0xFFFDFCE9),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
