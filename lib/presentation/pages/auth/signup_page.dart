import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';

import '../../widgets/footer_text_auth.dart';
import '../../widgets/label_text_auth.dart';
import '../../widgets/spacer_height.dart';
import '../../widgets/styled_button.dart';
import '../../widgets/text_field_auth.dart';
import '../../widgets/title_text_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passFocusNode = FocusNode();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 29),
          color: custWhiteColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SpacerHeight(spaceHeight: 56 + 41),
                    const TitleTextAuth(headerText: "Create an account", bodyText: "Connect with your friends today!"),
                    const SpacerHeight(spaceHeight: 52),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: LabelTextAuth(
                        labelText: "",
                        sendedContext: context,
                        textFieldFocusNode: emailFocusNode,
                        labelTextColor: custPrimaryColor,
                      ),
                    ),
                    TextFieldAuth(
                      textFieldController: emailController,
                      textFieldFocusNode: emailFocusNode,
                      isPasswordField: false,
                      hintText: "Email Address",
                    ),
                    const SpacerHeight(spaceHeight: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: LabelTextAuth(
                        labelText: "Phone Number",
                        sendedContext: context,
                        textFieldFocusNode: phoneFocusNode,
                        labelTextColor: custPrimaryColor,
                      ),
                    ),
                    TextFieldAuth(
                      prefixText: "+855",
                      textFieldController: phoneController,
                      textFieldFocusNode: phoneFocusNode,
                      isPasswordField: false,
                      hintText: "Phone Number",
                    ),
                    const SpacerHeight(spaceHeight: 12),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: LabelTextAuth(
                        labelText: passForm,
                        sendedContext: context,
                        textFieldFocusNode: passFocusNode,
                        labelTextColor: custPrimaryColor,
                      ),
                    ),
                    TextFieldAuth(
                      textFieldController: passController,
                      textFieldFocusNode: passFocusNode,
                      isPasswordField: true,
                      hintText: hintPassword,
                    ),
                    const SpacerHeight(spaceHeight: 17),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              padding: const EdgeInsets.only(right: 7),
                              child: Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                ),
                                side: const BorderSide(
                                  width: 0,
                                ),
                                fillColor: WidgetStateColor.resolveWith((states) => Colors.black),
                                splashRadius: 0,
                                visualDensity: VisualDensity.compact,
                                value: isRememberMe,
                                onChanged: (v) =>
                                    setState(() => isRememberMe = v ?? false),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => isRememberMe = !isRememberMe),
                              child: LabelTextAuth(
                                labelText: rememberMe,
                                sendedContext: context,
                                labelTextColor: custBlackColor,
                              ),
                            ),
                          ],
                        ),
                        LabelTextAuth(
                          labelText: forgotPassword,
                          sendedContext: context,
                          labelTextColor: custRedErrorColor,
                        ),
                      ],
                    ),
                    const SpacerHeight(spaceHeight: 45),
                    StyledButton(
                      actionButton: () {
                        if (emailController.text.isEmpty ||
                            passController.text.isEmpty || phoneController.text.isEmpty) {
                          debugPrint('isi semua data terlebih dahulu!');
                          return;
                        }
                        debugPrint(emailController.text);
                        debugPrint(phoneController.text);
                        debugPrint(passController.text);
                      },
                      buttonText: "Sign Up",
                      buttonColor: custPrimaryColor,
                      textColor: custWhiteColor,
                    ),
                    const SpacerHeight(spaceHeight: 22),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: custGreyColor))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 19),
                          child: Text(
                            orWith,
                            style: TextStyle(color: custGreyColor),
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          child: Container(
                            height: 1,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: custGreyColor))),
                          ),
                        ),
                      ],
                    ),
                    const SpacerHeight(spaceHeight: 22),
                    StyledButton(
                      actionButton: () {},
                      buttonText: googleText,
                      buttonColor: custWhiteColor,
                      textColor: custBlackColor,
                      outlineButtonColor: custGreyColor,
                      buttonIconAsSvg: SvgPicture.asset('assets/icons/google.svg'),
                    ),
                  ],
                ),
              ),
              FooterTextAuth(
                  sentenceText: "Already have an account ?  ",
                  pressableText: "Login",
                  navigateTo: () => context.goNamed('login'))
            ],
          ),
        ),
      ),
    );
  }
}
