import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../widgets/tab_section.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: offwhite,
        body: Stack(children: [
          Image.asset(
            "assets/images/back.png",
            color: Colors.grey.withOpacity(.2),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    tabSection(context),
                  ],
                ),
              )),
        ]),
      ),
    ]);
  }
}
