import 'package:flutter/material.dart';
import 'package:teste_coins/app/shared/widgets/shimmer_widget.dart';

import '../constants.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Constants.black,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: const ListTile(
        title: ShimmerWidget.rectangular(heigh: 16),
        subtitle: ShimmerWidget.rectangular(heigh: 14),
        leading: ShimmerWidget.circular(
          width: 64,
          heigh: 64,
        ),
      ),
    );
  }
}
