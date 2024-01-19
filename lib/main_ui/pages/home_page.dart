import 'package:c12_track/main_ui/constants.routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c12_track/main_ui/widgets/footprint.dart';
import 'package:c12_track/main_ui/widgets/footprint_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _travelController = TextEditingController();
  final _energyController = TextEditingController();
  final _foodController = TextEditingController();
  final _otherController = TextEditingController();

  double travelAmount = 0;
  double energyAmount = 0;
  double foodAmount = 0;
  double otherAmount = 0;

  double finalSum = 0;

  void returnFinalSum() {
    finalSum = travelAmount + energyAmount + foodAmount + otherAmount;
  }

  @override
  void dispose() {
    _travelController.dispose();
    _energyController.dispose();
    _foodController.dispose();
    _otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Column(
      children: [
        Footprint(
          title: "Travel",
          amount: travelAmount,
          suggestion: "suggestion",
          icon: Icons.pedal_bike,
        ),
        Footprint(
          title: "Energy",
          amount: energyAmount,
          suggestion: "suggestion",
          icon: Icons.energy_savings_leaf_outlined,
        ),
        Footprint(
          title: "Food",
          amount: foodAmount,
          suggestion: "suggestion",
          icon: Icons.lunch_dining,
        ),
        Footprint(
          title: "Other",
          amount: otherAmount,
          suggestion: "suggestion",
          icon: Icons.more_horiz,
        ),
      ],
    );
    void addFootprints(BuildContext context) {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: const Color(0xFF008080),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "Add footprints data (0 if N.A)",
                  style: TextStyle(
                    color: Color(0xFFFDFCE9),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _travelController,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter distance travelled (in kms)"),
                  ),
                ),
                TextField(
                  controller: _energyController,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter power consumption (in kWh)"),
                  ),
                ),
                TextField(
                  controller: _foodController,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Enter food consumption (in grams)"),
                  ),
                ),
                TextField(
                  controller: _otherController,
                  maxLength: 20,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Add other data (if any)"),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFDFCE9),
                    foregroundColor: const Color(0xFF013030),
                  ),
                  onPressed: () {
                    setState(() {
                      travelAmount = double.parse(_travelController.text) * 2.2;
                      energyAmount =
                          double.parse(_energyController.text) * 0.45;
                      foodAmount = double.parse(_foodController.text) * 0.005;
                      otherAmount = double.parse(_otherController.text);
                    });

                    Navigator.pop(context);
                  },
                  child: const Text("Add"),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF013030),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel"),
                )
              ],
            ),
          );
        },
      );
    }

    returnFinalSum();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome UserXYZ"),
        backgroundColor: const Color(0xFF013030),
        foregroundColor: const Color(0xFFFDFCE9),
        actions: [
          IconButton(
            onPressed: () {
              addFootprints(context);
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                loginRoute,
                (route) => false,
              );
            },
            icon: const Icon(Icons.logout),
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
            "Today's carbon footprint (KGs)",
            style: TextStyle(
                color: Color(0xFFFDFCE9),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          FootprintNumber(sum: finalSum),
          const SizedBox(
            height: 20,
          ),
          mainContent,
        ],
      ),
    );
  }
}
