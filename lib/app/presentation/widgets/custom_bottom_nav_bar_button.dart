import 'package:flutter/material.dart';
import 'package:libya_bakery/app/core/utils/app_color.dart';

class CustomBottomNavigationBarButton extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData iconData;
  bool active = false;
  CustomBottomNavigationBarButton({super.key,this.onPressed, required this.textButton, required this.iconData, required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, color: active == true ? yellow : Colors.black,),
          Text(textButton,style: TextStyle(fontSize: 20,color:active == true ? yellow : Colors.black),),
        ],
      ),
    );
  }
}
