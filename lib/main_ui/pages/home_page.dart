import 'package:c12_track/main_ui/constants/routes.dart';
import 'package:c12_track/main_ui/constants/suggestions.dart';
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

  String getTravelSuggestions(context) {
    return travelSuggestion(travelAmount);
  }

  String getEnergySuggestions(context) {
    return energySuggestion(energyAmount);
  }

  String getFoodSuggestions(context) {
    return foodSuggestion(foodAmount);
  }

  String getOtherSuggestions(context) {
    return otherSuggestion(otherAmount);
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
    Widget mainContent = SingleChildScrollView(
      child: Column(
        children: [
          Footprint(
            title: "Travel",
            amount: travelAmount.floorToDouble(),
            suggestion: getTravelSuggestions(context),
            icon: Icons.pedal_bike,
          ),
          Footprint(
            title: "Energy",
            amount: energyAmount.floorToDouble(),
            suggestion: getEnergySuggestions(context),
            icon: Icons.energy_savings_leaf_outlined,
          ),
          Footprint(
            title: "Food",
            amount: foodAmount.floorToDouble(),
            suggestion: getFoodSuggestions(context),
            icon: Icons.lunch_dining,
          ),
          Footprint(
            title: "Other",
            amount: otherAmount.floorToDouble(),
            suggestion: getOtherSuggestions(context),
            icon: Icons.more_horiz,
          ),
        ],
      ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: TextField(
                    controller: _travelController,
                    maxLength: 20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter distance travelled (in kms)"),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xFFFDFCE9),
                      ),
                      prefixIcon: Icon(Icons.pedal_bike),
                      prefixIconColor: Color(0xFF013030),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFDFCE9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF013030),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: TextField(
                    controller: _energyController,
                    maxLength: 20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter power consumption (in kWh)"),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xFFFDFCE9),
                      ),
                      prefixIcon: Icon(Icons.energy_savings_leaf_outlined),
                      prefixIconColor: Color(0xFF013030),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFDFCE9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF013030),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: TextField(
                    controller: _foodController,
                    maxLength: 20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter food consumed (in grams)"),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xFFFDFCE9),
                      ),
                      prefixIcon: Icon(Icons.lunch_dining),
                      prefixIconColor: Color(0xFF013030),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFDFCE9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF013030),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 8,
                  ),
                  child: TextField(
                    controller: _otherController,
                    maxLength: 20,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Enter other data (if any)"),
                      floatingLabelStyle: TextStyle(
                        color: Color(0xFFFDFCE9),
                      ),
                      prefixIcon: Icon(Icons.more_horiz),
                      prefixIconColor: Color(0xFF013030),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFFDFCE9),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF013030),
                          width: 1,
                        ),
                      ),
                    ),
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
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Color(0xFFFDFCE9),
                    ),
                  ),
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
        title: const Text("Welcome Deadlock"),
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
      body: SingleChildScrollView(
        child: Column(
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
                fontWeight: FontWeight.bold,
              ),
            ),
            FootprintNumber(sum: finalSum),
            const SizedBox(
              height: 20,
            ),
            mainContent,
          ],
        ),
      ),
    );
  }
}
