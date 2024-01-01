import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                "assets/images/logo.png",
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Image.asset(
                "assets/images/logo_two.png",
                width: 70,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: .04 * MediaQuery.sizeOf(context).width,
          ),
          child: Text(
            "كوشتنا",
            style: GoogleFonts.arefRuqaa(fontSize: 25, color: green),
          ),
        ),
      ],
    );
  }
}
