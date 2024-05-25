import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';

import '../extension/theme.dart';

class ItemBottomNavbar extends StatelessWidget {
  final bool isSelected;
  final String pathIconImage0;
  final String pathIconImage1;
  final String itemTextTitle;
  final Function() onTapAction;

  const ItemBottomNavbar({
    super.key,
    required this.isSelected,
    required this.pathIconImage0,
    required this.pathIconImage1,
    required this.itemTextTitle,
    required this.onTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: onTapAction,
        child: Container(
          color: custWhiteColor,
          width: double.maxFinite,
          padding: const EdgeInsets.only(bottom: 6, top: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                isSelected ? pathIconImage1 : pathIconImage0,
                width: 22,
                height: 22,
              ),
              Text(
                itemTextTitle,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? custPrimaryColor : custGreyColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
