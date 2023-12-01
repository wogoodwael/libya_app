import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

class ClientsBody extends StatelessWidget {
  const ClientsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: .8 * MediaQuery.sizeOf(context).width,
      height: .32 * MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3)]),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const ImageIcon(AssetImage("assets/images/edit.png")),
              const Text(
                "محمد عبد السلام هلالي ",
                style: TextStyle(
                    fontFamily: 'ArabicUIDisplay',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: green),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: Image.asset(
                  "assets/images/person.png",
                  fit: BoxFit.cover,
                  color: green,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: yellow,
            endIndent: 10,
            indent: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "صاحب متجر ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  ": نوع الحساب ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: green),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  " الشرق الاوسط (فرع ترابلس) ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  ": نوع الحساب ",
                  style: TextStyle(
                      fontFamily: 'ArabicUIDisplayBold',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: green),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: yellow,
            endIndent: 10,
            indent: 10,
          ),
          MaterialButton(
            elevation: 5,
            color: darkGreen,
            minWidth: .7 * MediaQuery.sizeOf(context).width,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            onPressed: () {},
            child: const Text(
              "عرض ",
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplay',
                  color: yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          ),
          MaterialButton(
            elevation: 5,
            color: yellow,
            minWidth: .7 * MediaQuery.sizeOf(context).width,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            onPressed: () {},
            child: const Text(
              "الدين السابق ",
              style: TextStyle(
                  fontFamily: 'ArabicUIDisplay',
                  color: darkGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
