import 'package:flutter/material.dart';

import '../../../admin/core/utils/app_color.dart';

class MenuRow extends StatelessWidget {
  const MenuRow({super.key, required this.text, this.ontap});
  final String text;
 final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.arrow_back_ios_new,
            color: yellow,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
