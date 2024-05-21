import 'package:flutter/material.dart';

import '../../widgets/base_page_appbar.dart';

class PasienPage extends StatelessWidget {
  const PasienPage({super.key});


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
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Text("Pasien coy");
            },
          ),
        ),
      ],
    );
  }
}
