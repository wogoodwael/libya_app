import 'package:flutter/material.dart';

 showErrorSnack(BuildContext context, String text){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          content: Text(text,textAlign: TextAlign.right,),
          margin: EdgeInsets.only(
              bottom: MediaQuery.sizeOf(context).height - 100,
              top: 10,
              right: 5,
              left: 5),
        ));
}

showSuccessSnack(BuildContext context, String text){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    behavior: SnackBarBehavior.floating,
    content: Text(text,textAlign: TextAlign.right,),
    margin: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height - 100,
        top: 10,
        right: 5,
        left: 5),
  ));
}