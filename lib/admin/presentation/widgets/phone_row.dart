import 'package:flutter/material.dart';

class CustomPhoneTextField extends StatelessWidget {
  const CustomPhoneTextField({super.key, required this.controller});
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          height: 40,
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/images/libya.png",
                  width: 30,
                ),
              ),
              const Text(
                "+218",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 200,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: TextFormField(
            controller: controller,
            keyboardType: TextInputType.phone,
            textAlign: TextAlign.end,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
