import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/base_page_appbar.dart';

class DokterPage extends StatelessWidget {
  const DokterPage({super.key});

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
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Text("Dokter coy");
            },
          ),
        ),
      ],
    );
  }
}
