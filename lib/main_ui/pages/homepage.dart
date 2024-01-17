import 'package:c12_track/lists/footprints_list.dart';
import 'package:c12_track/main_ui/models/footprints.dart';
import 'package:flutter/material.dart';
import 'package:c12_track/main_ui/widgets/footprint_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Footprints> _addedFootprints = [
    Footprints(
      footprintName: "Travel",
      amount: 00,
      suggestion: "meow",
      footprintnames: FootprintName.travel,
    ),
    Footprints(
      footprintName: "Energy",
      amount: 00,
      suggestion: "meow",
      footprintnames: FootprintName.energy,
    ),
    Footprints(
      footprintName: "Food",
      amount: 00,
      suggestion: "meow",
      footprintnames: FootprintName.food,
    ),
    Footprints(
      footprintName: "Other",
      amount: 00,
      suggestion: "meow",
      footprintnames: FootprintName.other,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text(
        "No footprints yet",
        style: TextStyle(
          color: Color(0xFFFDFCE9),
        ),
      ),
    );

    if (_addedFootprints.isNotEmpty) {
      mainContent = FootprintsList(
        footprintslist: _addedFootprints,
      );
    }

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
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
