import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAddressTextField extends StatelessWidget {
  CustomAddressTextField(
      {super.key,
        this.perfix,
        required this.secure,
        this.height,
        this.controller});
  Widget? perfix;
  final bool secure;
  double? height;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .02 * MediaQuery.sizeOf(context).width),
      width: .85 * MediaQuery.sizeOf(context).width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: controller,
        obscureText: secure,
        maxLength: 20,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 20),
        decoration:
        InputDecoration(border: InputBorder.none, prefixIcon: perfix),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomLoginContainer extends StatelessWidget {
  CustomLoginContainer({super.key, required this.pass, this.perfix, this.controller});
  final bool pass;
  Widget? perfix;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .07 * MediaQuery.sizeOf(context).width),
      width: .80 * MediaQuery.sizeOf(context).width,
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: controller,
        obscureText: pass,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 18),
        decoration:
        InputDecoration(border: InputBorder.none, prefixIcon: perfix),
      ),
    );
  }
}
