import 'package:flutter/material.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';

class AppbarWithBack extends StatelessWidget {
  final Color buttonBackColor;
  final Color buttonBackIconColor;
  final String appBarTitleText;
  final Color appBarTitleColor;
  final Function() buttonOnTapAction;

  const AppbarWithBack({
    super.key,
    required this.buttonBackColor,
    required this.buttonBackIconColor,
    required this.appBarTitleText,
    required this.appBarTitleColor,
    required this.buttonOnTapAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: buttonOnTapAction,
              child: Ink(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: buttonBackColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: buttonBackIconColor,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
          Text(
            appBarTitleText,
            style: TextStyle(
              fontSize: headingTextSize,
              color: appBarTitleColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
    );
  }
}
