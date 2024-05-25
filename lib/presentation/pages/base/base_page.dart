// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/dashboard_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/dokter_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/pasien_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/rekam_medis_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/transaksi_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/bottom_navbar.dart';

import '../../widgets/item_bottom_navbar.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke base setiap kali halaman diinisialisasi
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.goNamed('base');
    });
  }

  final PageController basePageController = PageController(
    initialPage: 0,
  );

  final List<String> navImg0 = [
    'assets/icons/navbar/navbar_clinic_0.svg',
    'assets/icons/navbar/navbar_patient_0.svg',
    'assets/icons/navbar/navbar_doctor_0.svg',
    'assets/icons/navbar/navbar_rekam_medis_0.svg',
    'assets/icons/navbar/navbar_transaction_0.svg',
  ];

  final List<String> navImg1 = [
    'assets/icons/navbar/navbar_clinic_1.svg',
    'assets/icons/navbar/navbar_patient_1.svg',
    'assets/icons/navbar/navbar_doctor_1.svg',
    'assets/icons/navbar/navbar_rekam_medis_1.svg',
    'assets/icons/navbar/navbar_transaction_1.svg',
  ];

  int _selectedIndex = 0;

  void _changePageTo(int index){
    _selectedIndex = index;
    basePageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: basePageController,
              onPageChanged: (value) => setState(() {
                _selectedIndex = value;
              }),
              children: [
                DashboardPage(),
                PasienPage(),
                DokterPage(),
                RekamMedisPage(),
                TransaksiPage(),
              ],
            ),
          ),
          BottomNavbar(
            backgroundColor: custWhiteColor,
            itemsBottomNavbar: [
              ItemBottomNavbar(
                isSelected: _selectedIndex == 0,
                pathIconImage0: navImg0[0],
                pathIconImage1: navImg1[0],
                itemTextTitle: "Clinic",
                onTapAction: (){
                  _changePageTo(0);
                },
              ),
              ItemBottomNavbar(
                isSelected: _selectedIndex == 1,
                pathIconImage0: navImg0[1],
                pathIconImage1: navImg1[1],
                itemTextTitle: "Patient",
                onTapAction: (){
                  _changePageTo(1);
                },
              ),
              ItemBottomNavbar(
                isSelected: _selectedIndex == 2,
                pathIconImage0: navImg0[2],
                pathIconImage1: navImg1[2],
                itemTextTitle: "Doctor",
                onTapAction: (){
                  _changePageTo(2);
                },
              ),
              ItemBottomNavbar(
                isSelected: _selectedIndex == 3,
                pathIconImage0: navImg0[3],
                pathIconImage1: navImg1[3],
                itemTextTitle: "Medic",
                onTapAction: (){
                  _changePageTo(3);
                },
              ),
              ItemBottomNavbar(
                isSelected: _selectedIndex == 4,
                pathIconImage0: navImg0[4],
                pathIconImage1: navImg1[4],
                itemTextTitle: "Transaction",
                onTapAction: (){
                  _changePageTo(4);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
