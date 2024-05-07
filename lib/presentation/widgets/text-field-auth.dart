import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/strings.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/theme.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/values.dart';

class TextFieldAuth extends StatefulWidget {
  final FocusNode textFieldFocusNode;
  final String? prefixText;
  final bool isPasswordField;
  final TextEditingController textFieldController;

  const TextFieldAuth({
    super.key,
    required this.textFieldFocusNode,
    this.prefixText,
    required this.isPasswordField,
    required this.textFieldController,
  });

  @override
  State<TextFieldAuth> createState() => _TextFieldAuthState();
}

class _TextFieldAuthState extends State<TextFieldAuth> {
  @override
  Widget build(BuildContext context) {
    bool _hidePass = widget.isPasswordField;

    return StatefulBuilder(
      builder: (BuildContext context, setState){
        return TextFormField(
          controller: widget.textFieldController,
          obscureText: _hidePass,
          focusNode: widget.textFieldFocusNode,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custGreyColor,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: custPrimaryColor,
                width: 1,
              ),
            ),
            hintStyle: TextStyle(
              color: custGreyColor,
              fontSize: bodyTextSize,
            ),
            prefixIcon:
              widget.prefixText != null?
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Text(widget.prefixText!, style: TextStyle(color: custBlackColor, fontSize: bodyTextSize, fontWeight: FontWeight.w600),),
                )
              : null,
            suffixIcon:
              widget.isPasswordField ?
                GestureDetector(
                  onTap: () => setState(() => _hidePass = !_hidePass),
                  child: const Icon(Icons.remove_red_eye_rounded),
                )
              : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
            hintText: hintEmail,
          ),
        );
      }
    );
  }
}
