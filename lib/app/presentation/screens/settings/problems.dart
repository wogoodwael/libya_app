import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/core/helper/snack.dart';
import 'package:libya_bakery/app/core/utils/back_image.dart';
import 'package:libya_bakery/app/core/utils/person.dart';
import 'package:libya_bakery/app/presentation/widgets/custom_next.dart';
import '../../../../admin/core/utils/app_color.dart';
import '../../../controller/complains_controller.dart';

class ProblemScreen extends StatefulWidget {
  const ProblemScreen({super.key});

  @override
  State<ProblemScreen> createState() => _ProblemScreenState();
}

class _ProblemScreenState extends State<ProblemScreen> {
  String? text;
  int val = 0;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Get.put(ComplainsController());
    return Scaffold(
      backgroundColor: offwhite,
      body: GetBuilder<ComplainsController>(
        builder: (controller) {
          return Stack(
            children: [
              const BackGroundImage(),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: .25 * MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                          color: darkGreen,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: .08 * MediaQuery.sizeOf(context).height,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: .01 * MediaQuery.sizeOf(context).width,
                              ),
                        const Person(),

                              SizedBox(
                                width: .04 * MediaQuery.sizeOf(context).width,
                              ),
                              const Text(
                                "الشكاوي والمقترحات",
                                style: TextStyle(
                                    fontFamily: 'ArabicUIDisplayBold',
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: yellow),
                              ),
                              SizedBox(
                                width: .02 * MediaQuery.sizeOf(context).width,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: yellow,
                                  size: 30,
                                  weight: 200,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: .04 * MediaQuery.sizeOf(context).height,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "اختر الفرع الذي يتم التعامل معه ",
                        style: TextStyle(
                            color: darkGreen,
                            fontFamily: 'ArabicUIDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      width: .89 * MediaQuery.sizeOf(context).width,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  branshMenu(context);
                                },
                                icon: const Icon(Icons.arrow_drop_down_outlined)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                text ?? "يرجي الاختيار",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: .03 * MediaQuery.sizeOf(context).height,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        " ما الذي تريد التحدث عنه؟ ",
                        style: TextStyle(
                            color: darkGreen,
                            fontFamily: 'ArabicUIDisplay',
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      alignment: Alignment.centerLeft,
                      width: .90 * MediaQuery.sizeOf(context).width,
                      height: .35 * MediaQuery.sizeOf(context).height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              controller: textEditingController,
                              textDirection: TextDirection.rtl,
                              maxLines: null,
                              style: const TextStyle(
                                fontSize: 18
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اكتب هنا ',
                                  hintStyle: TextStyle(color: Colors.grey),
                                  hintTextDirection: TextDirection.rtl),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .04 * MediaQuery.sizeOf(context).height,
                    ),
                    InkWell(
                      onTap: (){
                        controller.sendComplain(
                            textEditingController.text,
                            val
                        );
                        showErrorSnack(context,"تم إرسال الشكوى بنجاح");
                      },
                        child: CustomNext(text: 'ارسال')
                    )
                  ],
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  void branshMenu(BuildContext context) {
    showMenu(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      position: const RelativeRect.fromLTRB(1, 300, 50, 1),
      items: [
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = 'فرع تاجوراء';
            });
            val = 1;
          },
          value: 1,
          child: const Text('فرع تاجوراء'),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = '  فرع عين زارة ';
            });
            val = 2;
          },
          value: 2,
          child: const Text('  فرع عين زارة '),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = 'فرع ترابلس';
            });
            val = 3;
          },
          value: 3,
          child: const Text(
            'فرع ترابلس',
          ),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = '  فرع مصراتة  ';
            });
            val = 4;
          },
          value: 4,
          child: const Text(
            '  فرع مصراتة  ',
          ),
        ),
        PopupMenuItem(
          onTap: () {
            setState(() {
              text = 'فرع الزاويه ';
            });
            val = 5;
          },
          value: 5,
          child: const Text('فرع الزاويه '),
        ),
      ],
    );
  }
}
//**
 /*
// */