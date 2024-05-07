import 'package:flutter/material.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/values.dart';

class LabelTextAuth extends StatelessWidget {
  final String labelText;
  final BuildContext sendedContext;
  final FocusNode? textFieldFocusNode;
  final Color labelTextColor;

  const LabelTextAuth({
    super.key,
    required this.labelText,
    required this.sendedContext,
    this.textFieldFocusNode,
    required this.labelTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => textFieldFocusNode != null ? FocusScope.of(sendedContext).requestFocus(textFieldFocusNode) : null,
      child: Text(
        labelText,
        style: TextStyle(
          color: labelTextColor,
          fontSize: bodyTextSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
