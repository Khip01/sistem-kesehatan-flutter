import 'package:flutter/material.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/theme.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/values.dart';

class FooterTextAuth extends StatelessWidget {
  final String sentenceText;
  final String pressableText;
  final Function() navigateTo;

  const FooterTextAuth({
    super.key,
    required this.sentenceText,
    required this.pressableText,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 35),
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            sentenceText,
            style: TextStyle(
              color: custGreyColor,
              fontSize: bodyTextSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          InkWell(
            onTap: navigateTo,
            child: Text(
              pressableText,
              style: TextStyle(
                color: custPrimaryColor,
                fontSize: bodyTextSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
