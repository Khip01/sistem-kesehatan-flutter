import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/spacer_height.dart';

import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/appbar_with_back.dart';

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
              const SpacerHeight(spaceHeight: 20),
              AppbarWithBack(
                appBarTitleColor: custBlackColor,
                appBarTitleText: "Settings",
                buttonBackColor: custSecondaryColor,
                buttonBackIconColor: custWhiteColor,
                buttonOnTapAction: () => context.goNamed('base'),
              ),
              const SpacerHeight(spaceHeight: 12),
              _cardUserInfo(context, () => context.goNamed('user_info')),
              const SpacerHeight(spaceHeight: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _listTileTitle("About this app"),
                  _listTileItem(context, "About", Icons.info, (){}, false),
                  _listTileItem(context, "Connection", Icons.signal_cellular_connected_no_internet_4_bar, (){}, false),
                  const SpacerHeight(spaceHeight: 6),
                  _listTileTitle("Personalization"),
                  _listTileItem(context, "Theme", Icons.settings_display, (){}, false),
                  const SpacerHeight(spaceHeight: 6),
                  _listTileTitle("Account"),
                  _listTileItem(context, "About Your Credential", Icons.lock, (){}, false),
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
                    child: _listTileItem(context, "Logout", Icons.logout,
                      () => context.read<AuthBloc>().add(const AuthEvent.logout()), true,),
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
      padding: const EdgeInsets.symmetric(vertical: 16),
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

  Widget _listTileTitle(String titleText){
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: bodyTextSize,
          fontWeight: FontWeight.bold,
          color: custGreyColor,
        ),
      ),
    );
  }

  Widget _listTileItem(
      BuildContext context, String listTileTitle, IconData listTileIcon, Function() onTapAction, bool isDanger) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
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
