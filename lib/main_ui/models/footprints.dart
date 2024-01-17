import 'package:flutter/material.dart';

enum FootprintName { travel, energy, food, other }

const footprintIcons = {
  FootprintName.travel: Icons.pedal_bike,
  FootprintName.energy: Icons.energy_savings_leaf_outlined,
  FootprintName.food: Icons.lunch_dining,
  FootprintName.other: Icons.more_horiz,
};

class Footprints {
  Footprints({
    required this.footprintName,
    required this.amount,
    required this.suggestion,
    required this.footprintnames,
  });

  final String footprintName;
  final double amount;
  final String suggestion;
  final FootprintName footprintnames;
}

class FootprintsBucket {
  const FootprintsBucket({
    required this.footprintnames,
    required this.footprints,
  });

  FootprintsBucket.forFootprintName(
      List<Footprints> allFootprints, this.footprintnames)
      : footprints = allFootprints
            .where((footprintInstance) =>
                footprintInstance.footprintnames == footprintnames)
            .toList();

  final FootprintName footprintnames;
  final List<Footprints> footprints;
}
