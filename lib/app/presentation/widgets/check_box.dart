import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/functions/check_internet.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool rememberMe = false;
  bool agree = false;

  Future<void> saveRememberMe(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('rememberMe', value);
  }

  Future<bool> loadRememberMe() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberMe') ?? false;
  }

  var res;

  intialData() async {
    res = await checkInternet();
    if (kDebugMode) {
      print('Internet Connected: $res');
    }
  }

  @override
  void initState() {
    super.initState();
    intialData();
    loadRememberMe().then((value) {
      setState(() {
        rememberMe = value;
      });
    });
  }

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
                value: rememberMe,
                onChanged: (val) {
                  setState(() {
                    rememberMe = val!;
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
