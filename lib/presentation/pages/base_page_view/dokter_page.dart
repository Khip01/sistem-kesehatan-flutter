import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sistem_kesehatan_flutter/domain/entities/doctor.dart';
import 'package:sistem_kesehatan_flutter/presentation/blocs/doctor/doctor_bloc.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/image_auto_reload.dart';

import '../../widgets/base_page_appbar.dart';

class DokterPage extends StatelessWidget {
  DokterPage({super.key});

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
          child: _bodyScreen(),
        ),
      ],
    );
  }

  Widget _bodyScreen() {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
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
          success: (doctors) {
            return _cardListView(doctors);
          },
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
            child: Shimmer.fromColors(
              baseColor: custGreyColor,
              highlightColor: custShadowColor,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraint) {
                  return Row(
                    children: [
                      Container(
                        height: constraint.maxHeight - 16,
                        width: constraint.maxHeight - 16,
                        margin: const EdgeInsets.all(8),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: custPrimaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Padding(
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
                    ],
                  );
                },
              ),
            ),
          );
        },
      );
    }

  Widget _cardListView(List<Doctor> doctors){
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
      // child: Image.network(
      //   doctor.photo,
      //   fit: BoxFit.cover,
      // ),
      child: ImageAutoReload(
        name: doctor.name,
        imageUrl: doctor.photo,
        containerWidth: imageSizeWithoutMargin,
        containerHeight: imageSizeWithoutMargin,
        imageFit: BoxFit.cover,
        containerBorderRadius: BorderRadius.circular(16),
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
