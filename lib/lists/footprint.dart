import 'package:c12_track/main_ui/models/footprints.dart';
import 'package:flutter/material.dart';

class Footprint extends StatelessWidget {
  const Footprint(this.footprintInstance, {super.key});

  final Footprints footprintInstance;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF013030),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  footprintInstance.footprintName,
                  style: const TextStyle(
                      color: Color(0xFFFDFCE9),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      footprintIcons[footprintInstance.footprintnames],
                      color: const Color(0xFFFDFCE9),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      footprintInstance.amount.toString(),
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
                Text(
                  footprintInstance.suggestion.toString(),
                  style: const TextStyle(
                    color: Color(0xFFFDFCE9),
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
