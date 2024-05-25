import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_kesehatan_flutter/presentation/extension/extension.dart';
import 'package:sistem_kesehatan_flutter/presentation/widgets/base_page_appbar.dart';

import '../../blocs/auth/auth_bloc.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasePageAppbar(
          headerTextAppbar: "Clinic",
          isSearchable: false,
          isContainProfile: true,
          profileActionOnTap: () {
            context.goNamed('setting');
          },
        ),
        Flexible(
          fit: FlexFit.tight,
          child: Center(
            child: Text("Dashboard coy", style: TextStyle(color: custGreyColor),),
          ),
        ),
      ],
    );
  }
}
