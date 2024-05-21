import 'package:flutter/material.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/spacer_height.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: custWhiteColor,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: BoxDecoration(
                  color: custPrimaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  )),
            ),
            SafeArea(
              child: Column(
                children: [
                  const SpacerHeight(spaceHeight: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    width: double.maxFinite,
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.maxFinite,
                          child: Card(
                            margin: const EdgeInsets.only(top: 50),
                            elevation: 5,
                            color: custWhiteColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SpacerHeight(spaceHeight: 74),
                                  _labelSection(
                                      "Complete Name", "Akhmad Aakhif Athallah"),
                                  const SpacerHeight(spaceHeight: 16),
                                  _labelSection("Gender", "Male"),
                                  const SpacerHeight(spaceHeight: 16),
                                  _labelSection("Date of birth", "24 Oktober 2004"),
                                  const SpacerHeight(spaceHeight: 16),
                                  Row(
                                    children: [
                                      Flexible(
                                          flex: 1,
                                          child:
                                              _labelSection("Height (cm)", "1.65")),
                                      Flexible(
                                          flex: 1,
                                          child:
                                              _labelSection("Weight (kg)", "51")),
                                    ],
                                  ),
                                  const SpacerHeight(spaceHeight: 16),
                                  _labelSection("Blood group", "O"),
                                  const SpacerHeight(spaceHeight: 48),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/CattoPose.jpg',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _labelSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: bodyTextSize,
              fontWeight: FontWeight.bold,
              color: custGreyColor),
        ),
        const SpacerHeight(spaceHeight: 8),
        Text(
          content,
          style: TextStyle(
              fontSize: headingScreenTextSize, color: custBlackColor),
        ),
      ],
    );
  }
}
