import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/core/utils/app_color.dart';
import 'package:libya_bakery/presentation/widgets/branch_row.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:selectable_container/selectable_container.dart';

import '../../controller/branch_controller.dart';
import '../../data/services/api.dart';
import '../../handling_data/handlng_data_view.dart';

class BranchScreen extends StatefulWidget {
  const BranchScreen({super.key});

  @override
  State<BranchScreen> createState() => _BranchScreenState();
}

class _BranchScreenState extends State<BranchScreen> {
  bool _select1 = false;
  bool _select2 = false;
  bool _select3 = false;
  bool _select4 = false;
  bool _select5 = false;
  int val = 1;
  BranchController branchController = Get.put(BranchController());

  @override
  Widget build(BuildContext context) {
    Get.put(BranchController());
    return Scaffold(
      backgroundColor: offwhite,
      body: GetBuilder<BranchController>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Stack(
                children: [
                  Image.asset(
                    "assets/images/back.png",
                    color: Colors.grey.withOpacity(.2),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 10, //~30
                            ),
                            const Center(
                              child: Text(
                                "يرجي اختيار الفرع ",
                                style: TextStyle(
                                    color: green,
                                    fontFamily: 'ArabicUIDisplay',
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10, //~20
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SelectableContainer(
                                  selectedBackgroundColorIcon: green,
                                  borderRadius: 20,
                                  iconColor: offwhite,
                                  selectedBorderColor: green,
                                  unselectedBorderColor: const Color(0xfffefeec),
                                  unselectedBackgroundColor: const Color(0xfffefeec),
                                  unselectedOpacity: 1,
                                  marginColor: offwhite,
                                  selected: _select1,
                                  onValueChanged: (newValue) {
                                    setState(() {
                                      _select1 = newValue;
                                      _select2 = false;
                                      _select3 = false;
                                      _select4 = false;
                                      _select5 = false;
                                      val = 1;
                                    });
                                  },
                                  child: const BranchContainer(
                                    img: 'assets/images/branchone.png',
                                    text: 'فرع تاجوراء',
                                  ),
                                ),
                                SelectableContainer(
                                  selectedBackgroundColorIcon: green,
                                  borderRadius: 20,
                                  iconColor: offwhite,
                                  selectedBorderColor: green,
                                  unselectedBorderColor: const Color(0xfffefeec),
                                  unselectedBackgroundColor: const Color(0xfffefeec),
                                  unselectedOpacity: 1,
                                  marginColor: offwhite,
                                  selected: _select2,
                                  onValueChanged: (bool value) {
                                    setState(() {
                                      _select2 = value;
                                      _select1 = false;
                                      _select3 = false;
                                      _select4 = false;
                                      _select5 = false;
                                      val = 2;
                                    });
                                  },
                                  child: const BranchContainer(
                                    img: 'assets/images/branchone.png',
                                    text: '  فرع عين زارة ',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SelectableContainer(
                                  selectedBackgroundColorIcon: green,
                                  borderRadius: 20,
                                  iconColor: offwhite,
                                  selectedBorderColor: green,
                                  unselectedBorderColor: const Color(0xfffefeec),
                                  unselectedBackgroundColor: const Color(0xfffefeec),
                                  unselectedOpacity: 1,
                                  marginColor: offwhite,
                                  selected: _select3,
                                  onValueChanged: (bool value) {
                                    setState(() {
                                      _select3 = value;
                                      _select1 = false;
                                      _select2 = false;
                                      _select4 = false;
                                      _select5 = false;
                                      val = 3;
                                    });
                                  },
                                  child: const BranchContainer(
                                    img: 'assets/images/branchtwo.png',
                                    text: 'فرع ترابلس',
                                  ),
                                ),
                                SelectableContainer(
                                  selectedBackgroundColorIcon: green,
                                  borderRadius: 20,
                                  iconColor: offwhite,
                                  selectedBorderColor: green,
                                  unselectedBorderColor: const Color.fromARGB(255, 168, 168, 136),
                                  unselectedBackgroundColor: const Color(0xfffefeec),
                                  unselectedOpacity: 1,
                                  marginColor: offwhite,
                                  selected: _select4,
                                  onValueChanged: (bool value) {
                                    setState(() {
                                      _select4 = value;
                                      _select1 = false;
                                      _select3 = false;
                                      _select2 = false;
                                      _select5 = false;
                                      val = 4;
                                    });
                                  },
                                  child: const BranchContainer(
                                    img: 'assets/images/branchone.png',
                                    text: '  فرع مصراتة  ',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SelectableContainer(
                              selectedBackgroundColorIcon: green,
                              borderRadius: 20,
                              iconColor: offwhite,
                              selectedBorderColor: green,
                              unselectedBorderColor: const Color(0xfffefeec),
                              unselectedBackgroundColor: const Color(0xfffefeec),
                              unselectedOpacity: 1,
                              marginColor: offwhite,
                              selected: _select5,
                              onValueChanged: (bool value) {
                                setState(() {
                                  _select5 = value;
                                  _select1 = false;
                                  _select3 = false;
                                  _select4 = false;
                                  _select2 = false;
                                  val = 5;
                                });
                              },
                              child: const BranchContainer(
                                  img: 'assets/images/branchtwo.png', text: 'فرع الزاويه '),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            //*go to home page
                            GestureDetector(
                                onTap: () {
                                  branchController.chooseBranch(val);
                                  MyServices.sharedPreferences
                                      .setString('branch_code', val.toString());
                                },
                                child: CustomNext(text: 'التالي')),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          }
      ),
    );
  }
}
