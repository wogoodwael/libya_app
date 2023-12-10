import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/screens/admin/complaints.dart';

class ComplainsContainer extends StatelessWidget {
  const ComplainsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 10),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        color: yellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: const Text(
                          "عرض",
                          style: TextStyle(
                            fontFamily: "ArabicUIDisplayBold",
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: darkGreen,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "رقم الشكوي : #00000",
                          style: TextStyle(
                            fontFamily: "ArabicUIDisplayBold",
                            fontWeight: FontWeight.w700,
                            color: darkGreen,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                color: yellow,
                endIndent: 10,
                indent: 10,
                thickness: 1,
              ),
              Container(
                alignment: Alignment.topRight,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "xxxxx : إسم العميل",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20, top: 5),
                      child: Text(
                        "التاريخ : 15 أكتوبر , 2023 - 9:00 مساءً",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "xxxxxxxxxx : الفرع",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ComplaintsScreen()));
                },
                child: Container(
                  width: 291,
                  height: 45,
                  decoration: const BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
                    color: darkGreen,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text(
                      "تواصل مع العميل",
                      style: TextStyle(
                        fontFamily: "ArabicUIDisplay",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xffbfed700),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
