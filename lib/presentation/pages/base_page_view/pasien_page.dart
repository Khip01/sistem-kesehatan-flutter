import 'dart:math';

import 'package:flutter/material.dart';

import '../../extension/theme.dart';
import '../../extension/values.dart';
import '../../widgets/base_page_appbar.dart';

class PasienPage extends StatelessWidget {
  PasienPage({super.key});

  // TODO: Dummy Area
  List<String> patientNameMale = [
    "Agus Santoso",
    "Budi Raharjo",
    "Eko Prasetyo",
    "Fajar Nugroho",
    "Joko Susilo",
    "Hendra Wijaya",
    "Fahmi Hidayat",
    "Erik Saputra",
  ];

  List<String> patientNameFemale = [
    "Citra Dewi",
    "Dewi Lestari",
    "Gita Puspita",
    "Dian Kusuma",
    "Intan Sari",
  ];

  List<String> patientPhoneNum = [
    "+62 811 1111 1111",
    "+62 822 2222 2222",
    "+62 833 3333 3333",
    "+62 844 4444 4444",
    "+62 855 5555 5555",
    "+62 866 6666 6666",
    "+62 877 7777 7777"
  ];

  List<String> patientBirthDetail = [
    "Jakarta, 1 Januari 1980",
    "Bandung, 2 Februari 1985",
    "Surabaya, 3 Maret 1990",
    "Yogyakarta, 4 April 1982",
    "Semarang, 5 Mei 1987",
    "Medan, 6 Juni 1993",
    "Bali, 7 Juli 1995"
  ];

  List<String> patientGender = [
    "Male",
    "Female",
  ];

  String _getRandomizedPateientNameMale() => patientNameMale[Random().nextInt(8)];
  String _getRandomizedPateientNameFemale() => patientNameFemale[Random().nextInt(5)];
  String _getRandomizedPateientPhoneNum() => patientPhoneNum[Random().nextInt(7)];
  String _getRandomizedPateientBirthDetail() => patientBirthDetail[Random().nextInt(7)];
  String _getRandomizedPateientGender() => patientGender[Random().nextInt(2)];
  // TODO: End of dummy area


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasePageAppbar(
          headerTextAppbar: "Data Pasien",
          isSearchable: true,
          isContainProfile: false,
        ),
        Flexible(
          fit: FlexFit.tight,
          child: _cardListView(),
        ),
      ],
    );
  }

  Widget _cardListView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: (MediaQuery.of(context).size.width - 48) / 3,
          width: double.maxFinite,
          margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: custWhiteColor,
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(2, 2),
                color: custShadowColor,
              )
            ],
          ),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint){
              return _contentCardInfo();
            },
          ),
        );
      },
    );
  }

  Widget _contentCardInfo(){
    final String gender = _getRandomizedPateientGender();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            gender == "Male" ? _getRandomizedPateientNameMale() : _getRandomizedPateientNameFemale(),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: headingScreenTextSize,
              fontWeight: FontWeight.bold,
              color: custBlackColor,
            ),
          ),
          Text(
            _getRandomizedPateientBirthDetail(),
            style: TextStyle(
              fontSize: bodyTextSize,
              color: custGreyColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getRandomizedPateientPhoneNum(),
                style: TextStyle(
                  fontSize: bodyTextSize,
                  color: custBlackColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  // TODO: Label Gender Color Decision
                  color: gender == "Male" ? custGenderMale : custGenderFemale,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    gender,
                    style: TextStyle(
                      fontSize: 12,
                      color: custWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
