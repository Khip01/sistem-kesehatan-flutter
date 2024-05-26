import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../extension/theme.dart';
import '../extension/values.dart';

class BasePageAppbar extends StatelessWidget {
  final String headerTextAppbar;
  final bool isSearchable;
  final bool isContainProfile;
  final Function()? profileActionOnTap;
  final Function()? searchActionOnTap;

  BasePageAppbar({
    super.key,
    required this.headerTextAppbar,
    required this.isSearchable,
    required this.isContainProfile,
    this.profileActionOnTap,
    this.searchActionOnTap,
  });

  String dateTimeDescNow =
      DateFormat("EEEE, dd MMMM yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height / 7 - 30,
        width: double.maxFinite,
        padding: const EdgeInsets.only(bottom: 18, top: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 29),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerTextAppbar,
                    style: TextStyle(
                      fontSize: headingTextSize,
                      fontWeight: FontWeight.w600,
                      color: custBlackColor,
                    ),
                  ),
                  Text(
                    dateTimeDescNow,
                    style: TextStyle(
                      fontSize: bodyTextSize,
                      color: custGreyColor,
                    ),
                  ),
                ],
              ),
              if (isSearchable) _searchSection(),
              if (isContainProfile) _profileSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchSection() {
    return InkWell(
      onTap: () {},
      child: Ink(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: custSecondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            Icons.search,
            color: custWhiteColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _profileSection() {
    return InkWell(
      borderRadius: BorderRadius.circular(25),
      onTap: profileActionOnTap,
      child: Ink(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: custSecondaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Icon(
            Icons.person,
            color: custWhiteColor,
            size: 25,
          ),
        ),
      ),
    );
  }
}
