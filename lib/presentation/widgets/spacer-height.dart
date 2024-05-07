import 'package:flutter/material.dart';

class SpacerHeight extends StatelessWidget {
  final double spaceHeight;

  const SpacerHeight({
    super.key,
    required this.spaceHeight
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: spaceHeight,
    );
  }
}
