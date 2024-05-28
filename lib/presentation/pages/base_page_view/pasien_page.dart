import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sistem_kesehatan_flutter/domain/entities/patient.dart';
import 'package:sistem_kesehatan_flutter/presentation/blocs/patient/patient_bloc.dart';

import '../../extension/theme.dart';
import '../../extension/values.dart';
import '../../widgets/base_page_appbar.dart';

class PasienPage extends StatelessWidget {
  PasienPage({super.key});

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
          child: _bodyScreen(),
        ),
      ],
    );
  }

  Widget _bodyScreen() {
    return BlocBuilder<PatientBloc, PatientState>(
      builder: (BuildContext context, state) {
        return state.maybeWhen(
          orElse: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          loading: () {
            return Center(
              child: _cardListViewShimmer(),
            );
          },
          success: (patients) {
            return _cardListView(patients);
          }
        );
      },
    );
  }

  Widget _cardListViewShimmer(){
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
          child: Shimmer.fromColors(
            baseColor: custGreyColor,
            highlightColor: custShadowColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 24,
                    decoration: BoxDecoration(
                      color: custPrimaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 12,
                    decoration: BoxDecoration(
                    color: custPrimaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 12,
                    decoration: BoxDecoration(
                      color: custPrimaryColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _cardListView(List<Patient> patients){
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20),
      itemCount: patients.length,
      itemBuilder: (BuildContext context, int index) {
        final patient = patients[index];
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
          child: _contentCardInfo(patient),
        );
      },
    );
  }

  Widget _contentCardInfo(Patient patient) {
    final String gender = patient.gender;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            patient.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              fontSize: headingScreenTextSize,
              fontWeight: FontWeight.bold,
              color: custBlackColor,
            ),
          ),
          Text(
            patient.birthDate,
            style: TextStyle(
              fontSize: bodyTextSize,
              color: custGreyColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                patient.phone,
                style: TextStyle(
                  fontSize: bodyTextSize,
                  color: custBlackColor,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  // TODO: Label Gender Color Decision
                  color: gender == "male" ? custGenderMale : custGenderFemale,
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
