import 'package:flutter/material.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/theme.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/values.dart';

class TitleTextAuth extends StatelessWidget {
  final String headerText;
  final String bodyText;

  const TitleTextAuth({
    super.key,
    required this.headerText,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 53,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style: TextStyle(fontSize: headingTextSize, fontWeight: FontWeight.w600, color: custBlackColor),
          ),
          Text(
            bodyText,
            style: TextStyle(fontSize: bodyTextSize, color: custGreyColor),
          ),
        ],
      ),
    );
  }
}
