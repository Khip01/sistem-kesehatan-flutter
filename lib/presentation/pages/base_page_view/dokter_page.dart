import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_kesehatan_flutter/domain/entities/doctor.dart';
import 'package:sistem_kesehatan_flutter/presentation/blocs/doctor/doctor_bloc.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';

import '../../widgets/base_page_appbar.dart';

class DokterPage extends StatelessWidget {
  DokterPage({super.key});

  // TODO: Dummy Area
  List<String> imagePath = [
    'assets/card_image_dummy/1.svg',
    'assets/card_image_dummy/2.svg',
    'assets/card_image_dummy/3.svg',
    'assets/card_image_dummy/4.svg',
    'assets/card_image_dummy/5.svg',
    'assets/card_image_dummy/6.svg',
    'assets/card_image_dummy/7.svg',
  ];

  List<String> doctorName = [
    "Dr. Terawan Agus Putranto, Sp.Rad(K)",
    "Dr. Bambang Supriyatno, Sp.A(K)",
    "Dr. Dante Saksono Harbuwono, Sp.PD-KEMD",
    "Dr. Aakhif",
    "Dr. Andhika Rachman, Sp.PD-KHOM",
    "Dr. Ratna Sitompul, Sp.M(K)",
    "Dr. Erlina Burhan, MSc, Sp.P(K)",
  ];

  List<String> doctorSpecialization = [
    "Radiologi",
    "Pediatri",
    "Endokrinologi",
    "Patologi Klinik",
    "Hematologi Onkologi Medis",
    "Oftalmologi",
    "Pulmonologi",
  ];

  List<String> doctorPhoneNum = [
    "+62 812 3456 7890",
    "+62 813 9876 5432",
    "+62 815 2345 6789",
    "+62 816 3456 7891",
    "+62 817 9876 5433",
    "+62 818 2345 6780",
    "+62 819 3456 7892"
  ];

  String _getRandomizedImagePath() => imagePath[Random().nextInt(7)];
  String _getRandomizedDoctorName() => doctorName[Random().nextInt(7)];
  String _getRandomizedDoctorSpec() =>
      doctorSpecialization[Random().nextInt(7)];
  String _getRandomizedDoctorPhone() => doctorPhoneNum[Random().nextInt(7)];
  // TODO: End of dummy area

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasePageAppbar(
          headerTextAppbar: "Data Dokter",
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
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          success: (doctors) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: doctors.length,
              itemBuilder: (BuildContext context, int index) {
                final doctor = doctors[index];
                return Container(
                  height: (MediaQuery.of(context).size.width - 48) / 2.7,
                  width: double.maxFinite,
                  margin:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 24),
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
                    builder: (BuildContext context, BoxConstraints constraint) {
                      return Row(
                        children: [
                          _image(constraint.maxHeight, doctor),
                          Flexible(
                            fit: FlexFit.tight,
                            child: _contentCardInfo(doctor),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _image(double size, Doctor doctor) {
    double imageSizeWithoutMargin = size - 16;
    return Container(
      height: imageSizeWithoutMargin,
      width: imageSizeWithoutMargin,
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.network(
        doctor.photo,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _contentCardInfo(Doctor doctor) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 7,
        left: 8,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            doctor.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: custBlackColor,
            ),
          ),
          Text(
            doctor.specialist,
            style: TextStyle(
              fontSize: bodyTextSize,
              color: custGreyColor,
            ),
          ),
          Text(
            doctor.phone,
            style: TextStyle(
              fontSize: bodyTextSize,
              color: custBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
