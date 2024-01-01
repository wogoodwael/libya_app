import 'package:flutter/material.dart';
import 'package:libya_bakery/app/core/utils/app_color.dart';

import '../../../../widgets/custom_next.dart';
import '../../../../widgets/info_row.dart';
import '../../../../widgets/text_field.dart';

class MarketInformationBody extends StatelessWidget {
  const MarketInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InfoRow(
            fontsize: 15,
            fontfamily: 'ArabicUIDisplayBold',
            icon: Icons.error,
            text: 'اسم المتجر ',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: false,
          height: 35,
          secure: false,
          // controller: '',
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InfoRow(
            fontsize: 15,
            fontfamily: 'ArabicUIDisplayBold',
            icon: Icons.error,
            text: 'عنوان المتجر',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: false,
          height: 35,
          secure: false,
          // controller: '',
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InfoRow(
            fontsize: 15,
            fontfamily: 'ArabicUIDisplayBold',
            icon: Icons.error,
            text: 'المدينة',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: false,
          height: 35,
          secure: false,
          // controller: '',
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InfoRow(
            fontsize: 15,
            fontfamily: 'ArabicUIDisplayBold',
            icon: Icons.error,
            text: 'رقم هاتف للمتجر',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: true,
          height: 35,
          secure: false,
          // controller: '',
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InfoRow(
            fontsize: 15,
            fontfamily: 'ArabicUIDisplayBold',
            icon: Icons.error,
            text: 'موقع المتجر',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              width: .8 * MediaQuery.sizeOf(context).width,
              height: 120,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: ExactAssetImage("assets/images/map.png")),
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 0.0,
                      color: Colors.grey,
                    ),
                  ]),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),

        const SizedBox(
          height: 20,
        ),
        CustomNext(text: 'حفظ'),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
