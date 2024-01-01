import 'package:flutter/material.dart';

import '../utils/app_color.dart';

 showErrorSnack(BuildContext context ,String text){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: green,
          behavior: SnackBarBehavior.floating,
          content: Text(
            text,
            textDirection:TextDirection.rtl,
            style: const TextStyle(
            fontSize: 18,
            fontFamily: 'ArabicUIDisplay',
          ),),
          margin: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height - 100,
              top: 10,
              right: 5,
              left: 5),
        ));
}