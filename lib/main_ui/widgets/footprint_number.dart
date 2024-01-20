import 'package:flutter/material.dart';

class FootprintNumber extends StatelessWidget {
  const FootprintNumber({
    super.key,
    required this.sum,
  });

  final double sum;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF008080),
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 0,
      ),
      width: double.infinity,
      height: 140,
      child: Center(
        child: Text(
          sum.toString(),
          style: const TextStyle(
            color: Color(0xFFFDFCE9),
            fontSize: 90,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
