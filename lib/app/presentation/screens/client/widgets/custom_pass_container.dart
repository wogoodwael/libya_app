import 'package:flutter/material.dart';

class CustomChangePass extends StatelessWidget {
  const CustomChangePass({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .06 * MediaQuery.sizeOf(context).width),
      width: .90 * MediaQuery.sizeOf(context).width,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: controller,
        obscureText: false,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: 'xxxxxxxxx'),
      ),
    );
  }
}
