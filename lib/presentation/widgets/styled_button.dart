import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/theme.dart';

class StyledButton extends StatelessWidget {
  final Function() actionButton;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final Color? outlineButtonColor;
  final double? buttonWidth;
  final double? buttonHeight;
  final Icon? buttonIcon;
  final SvgPicture? buttonIconAsSvg;

  const StyledButton({
    super.key,
    required this.actionButton,
    required this.buttonText,
    required this.buttonColor,
    this.outlineButtonColor,
    required this.textColor,
    this.buttonWidth,
    this.buttonHeight,
    this.buttonIcon,
    this.buttonIconAsSvg,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.maxFinite,
      height: buttonHeight ?? 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: custGreyColor,
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: outlineButtonColor ?? buttonColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: actionButton,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconLogic(),
            Text(
              buttonText,
              style: TextStyle(
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconLogic(){
    if(buttonIcon != null){
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SizedBox(
          height: 24,
          width: 24,
          child: buttonIconAsSvg,
        ),
      );
    } else if (buttonIconAsSvg != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 12),
        child: SizedBox(
          height: 24,
          width: 24,
          child: buttonIconAsSvg,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
