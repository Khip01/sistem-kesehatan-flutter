// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/dashboard_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/dokter_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/pasien_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/rekam_medis_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/pages/base_page_view/transaksi_page.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/bottom_navbar.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: PageView(
              controller: basePageController,
              children: [
                DashboardPage(),
                DokterPage(),
                PasienPage(),
                RekamMedisPage(),
                TransaksiPage(),
              ],
            ),
          ),
          BottomNavbar(
            backgroundColor: custWhiteColor,
            itemsBottomNavbar: [

            ],
          ),
        ],
      ),
    );
  }
}
