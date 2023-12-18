import 'package:flutter/material.dart';
import 'package:libya_bakery/controller/complains/complains_controller.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/screens/admin/complaints.dart';

class ComplainsContainer extends StatelessWidget {
  final ComplainsController controller;
  final int index;
  const ComplainsContainer({super.key, required this.controller, required this.index});

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
                  const SizedBox(
                    width: 90,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, top: 10),
                    child: Row(
                      children: [
                        Text(
                          "رقم الشكوي : #${controller.data[index].complainId}",
                          style: const TextStyle(
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
              const Divider(
                color: yellow,
                endIndent: 10,
                indent: 10,
                thickness: 1,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "${controller.data[index].firstName} ${controller.data[index].lastName} : إسم العميل",
                        style: const TextStyle(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20, top: 5),
                      child: Text(
                        "التاريخ : ${controller.data[index].complainDate}ً",
                        style: const TextStyle(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child:
                      controller.data[index].complainBranch == 1
                      ? const Text(
                        "الفرع : تاجوراء",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      )
                          : controller.data[index].complainBranch == 2
                        ? const Text(
                        "الفرع : عين زارة",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      ) : controller.data[index].complainBranch == 3
                        ? const Text(
                        "الفرع : تربلس",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      ) : controller.data[index].complainBranch == 4
                        ?  const Text(
                        "الفرع : مصراتة",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      ) :  const Text(
                        "الفرع : الزاوية",
                        style: TextStyle(
                          color: green,
                          fontFamily: 'ArabicUIDisplayBold',
                          fontSize: 14,
                        ),
                      )
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  controller.goToComplainScreen(controller.data[index]);
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
        const SizedBox(height: 15,)
      ],
    );
  }
}
