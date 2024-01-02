import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  Widget? perfix;
  final bool secure;
  final bool isNumber;
  final int? maxLength;
  double? height;
  TextEditingController? controller;

  CustomTextField({super.key,
    this.perfix,
    required this.secure,
    this.height,
    this.controller, this.maxLength, required this.isNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .02 * MediaQuery
              .sizeOf(context)
              .width),
      width: .85 * MediaQuery
          .sizeOf(context)
          .width,
      height: height,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: TextFormField(
          keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
          maxLength: maxLength,
          controller: controller,
          obscureText: secure,
          textAlign: TextAlign.end,
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 20),
          decoration:
          InputDecoration(border: InputBorder.none, prefixIcon: perfix),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomLoginContainer extends StatelessWidget {
  CustomLoginContainer(
      {super.key, required this.pass, this.perfix, this.controller});

  final bool pass;
  Widget? perfix;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: .07 * MediaQuery
              .sizeOf(context)
              .width),
      width: .80 * MediaQuery
          .sizeOf(context)
          .width,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        controller: controller,
        obscureText: pass,
        textAlign: TextAlign.end,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 20),
        decoration:
        InputDecoration(border: InputBorder.none, prefixIcon: perfix),
      ),
    );
  }
}
