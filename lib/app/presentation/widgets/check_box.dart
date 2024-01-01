import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool remeberMe = false;
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'تذكرني',
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplayBold',
                  fontWeight: FontWeight.bold),
            ),
            Checkbox(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (!states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                side: const BorderSide(color: Colors.white, width: 2),
                activeColor: Colors.white,
                checkColor: Colors.blue,

                //TODO: Shared prefernce

                value: remeberMe,
                onChanged: (val) {
                  setState(() {
                    remeberMe = val!;
                  });
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'اوافق علي الشروط والاحكام',
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplayBold',
                  fontWeight: FontWeight.bold),
            ),
            Checkbox(
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (!states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return null;
                }),
                side: const BorderSide(color: Colors.white, width: 2),
                checkColor: Colors.blue,
                activeColor: Colors.white,
                value: agree,
                    //TODO: Shared prefernce
                onChanged: (value) {
                  setState(() {
                    agree = value!;
                  });
                }),
          ],
        )
      ],
    );
  }
}
