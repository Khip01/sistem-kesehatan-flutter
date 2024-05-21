import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/spacer_height.dart';

import '../../blocs/auth/auth_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SpacerHeight(spaceHeight: 12),
              _cardUserInfo(context, () => context.goNamed('user_info')),
              const SpacerHeight(spaceHeight: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Another Setting",
                      style: TextStyle(
                        fontSize: bodyTextSize,
                        fontWeight: FontWeight.bold,
                        color: custGreyColor,
                      ),
                    ),
                  ),
                  _listTileItem(
                      context,
                      "Setting 1",
                      Icons.settings,
                      (){},
                      false
                  ),
                  _listTileItem(
                      context,
                      "Setting 2",
                      Icons.settings,
                      (){},
                      false
                  ),
                  _listTileItem(
                      context,
                      "Setting 3",
                      Icons.settings,
                      (){},
                      false
                  ),
                  const SpacerHeight(spaceHeight: 6),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "Account",
                      style: TextStyle(
                        fontSize: bodyTextSize,
                        fontWeight: FontWeight.bold,
                        color: custGreyColor,
                      ),
                    ),
                  ),
                  BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {
                      state.maybeWhen(
                        logoutSuccess: () {
                          context.goNamed('login');
                        },
                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        },
                        orElse: () {},
                      );
                    },
                    child: _listTileItem(
                      context,
                      "Logout",
                      Icons.logout,
                      () => context.read<AuthBloc>().add(const AuthEvent.logout()),
                      true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardUserInfo(BuildContext context, Function() onTapAction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTapAction,
        child: Ink(
          width: MediaQuery.of(context).size.width / 1.25,
          decoration: BoxDecoration(
            color: custWhiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: custShadowColor,
                offset: const Offset(0, 0),
                blurRadius: 30,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Akhmad Aakhif Athallah",
                      style: TextStyle(
                          fontSize: headingScreenTextSize,
                          fontWeight: FontWeight.bold,
                          color: custBlackColor),
                    ),
                    Text(
                      "admin@gmail.com",
                      style: TextStyle(
                          fontSize: bodyTextSize, color: custGreyColor),
                    ),
                    Text(
                      "Male",
                      style: TextStyle(
                          fontSize: bodyTextSize, color: custGreyColor),
                    ),
                  ],
                ),
                Icon(
                  Icons.info_outline,
                  color: custSecondaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listTileItem(
      BuildContext context, String listTileTitle, IconData listTileIcon, Function() onTapAction, bool isDanger) {
    return ListTile(
      leading: Icon(listTileIcon, color: isDanger ? custRedErrorColor : custGreyColor,),
      title: Text(
        listTileTitle,
        style: TextStyle(color: isDanger ? custRedErrorColor : custBlackColor),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: custGreyColor,
        size: 16,
      ),
      onTap: onTapAction,
    );
  }
}
