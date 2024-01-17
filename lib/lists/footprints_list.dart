import 'package:c12_track/lists/footprint.dart';
import 'package:flutter/material.dart';
import '../main_ui/models/footprints.dart';

class FootprintsList extends StatelessWidget {
  const FootprintsList({
    super.key,
    required this.footprintslist,
  });

  final List<Footprints> footprintslist;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: footprintslist.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(
          footprintslist[index],
        ),
        child: Footprint(
          footprintslist[index],
        ),
      ),
    );
  }
}
