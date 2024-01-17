import 'package:c12_track/lists/footprint.dart';
import 'package:flutter/material.dart';
import 'package:c12_track/main_ui/widgets/footprint_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Column(
      children: [
        Footprint(
          title: "Travel",
          amount: 00,
          suggestion: "suggestion",
          icon: Icons.pedal_bike,
        ),
        Footprint(
          title: "Energy",
          amount: 00,
          suggestion: "suggestion",
          icon: Icons.energy_savings_leaf_outlined,
        ),
        Footprint(
          title: "Food",
          amount: 00,
          suggestion: "suggestion",
          icon: Icons.lunch_dining,
        ),
        Footprint(
          title: "Other",
          amount: 00,
          suggestion: "suggestion",
          icon: Icons.more_horiz,
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome UserXYZ"),
        backgroundColor: const Color(0xFF013030),
        foregroundColor: const Color(0xFFFDFCE9),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      backgroundColor: const Color(0xFF008080),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Today's carbon footprint",
            style: TextStyle(
                color: Color(0xFFFDFCE9),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const FootprintNumber(),
          const SizedBox(
            height: 20,
          ),
          mainContent,
        ],
      ),
    );
  }
}
