import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:libya_bakery/presentation/widgets/info_row.dart';
import 'package:libya_bakery/presentation/widgets/text_field.dart';

class MarketInformationBody extends StatelessWidget {
  const MarketInformationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
        SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: false,
          height: 35,
          secure: false,
          // controller: '',
        ),
        SizedBox(
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
        SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: false,
          height: 35,
          secure: false,
          // controller: '',
        ),
        SizedBox(
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
        SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: false,
          height: 35,
          secure: false,
          // controller: '',
        ),
        SizedBox(
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
        SizedBox(
          height: 10,
        ),
        //todo: upload to server
        CustomTextField(
          isNumber: true,
          height: 35,
          secure: false,
          // controller: '',
        ),
        SizedBox(
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
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              width: .8 * MediaQuery.sizeOf(context).width,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: ExactAssetImage("assets/images/map.png")),
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      spreadRadius: 0.0,
                      color: Colors.grey,
                    ),
                  ]),
            ),
          ],
        ),
        SizedBox(
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
