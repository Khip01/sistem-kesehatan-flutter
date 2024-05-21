import 'package:flutter/material.dart';

import '../extension/theme.dart';

class BottomNavbar extends StatelessWidget {
  final Color backgroundColor;
  final List<Widget> itemsBottomNavbar;

  const BottomNavbar({
    super.key,
    required this.backgroundColor,
    required this.itemsBottomNavbar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: custShadowColor,
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(0, -2),
          )
        ],
      ),
      height: 64,
      width: double.maxFinite,
      child: const Center(
        child: Text("Ini Navbar"),
      ),
    );
  }
}
