import 'package:flutter/material.dart';

import '../../../../../core/utils/app_color.dart';
import '../../../../widgets/custom_next.dart';
import '../../../../widgets/info_row.dart';
import '../../../../widgets/text_field.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

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
            text: 'الاسم الاول',
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
            text: 'اسم العائلة',
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
            text: 'البريد الالكتروني',
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
            text: 'رقم الهاتف المحمول',
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100,
              height: 35,
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 30,
                      color: darkGreen,
                    ),
                    Image.asset("assets/images/libya.png"),
                    const Text("+211")
                  ]),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: .01 * MediaQuery.sizeOf(context).width),
              width: .6 * MediaQuery.sizeOf(context).width,
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                textAlign: TextAlign.end,
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        CustomNext(text: 'حفظ'),
      ],
    );
  }
}
