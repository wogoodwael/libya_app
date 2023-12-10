import 'package:flutter/material.dart';
import 'package:libya_bakery/core/utils/app_color.dart';

import 'package:libya_bakery/data/services/api.dart';
import 'package:libya_bakery/presentation/screens/admin/screens/sub_categories/sub_categories.dart';
import 'package:libya_bakery/presentation/widgets/branch_row.dart';
import 'package:libya_bakery/presentation/widgets/custom_next.dart';
import 'package:selectable_container/selectable_container.dart';


class BranchAdmin extends StatefulWidget {
  BranchAdmin({super.key});

  @override
  State<BranchAdmin> createState() => _BranchAdminState();
}

class _BranchAdminState extends State<BranchAdmin> {
  bool _select1 = false;

  bool _select2 = false;
  bool _select3 = false;
  bool _select4 = false;
  bool _select5 = false;
  int val = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: offwhite,
      body: Stack(
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
                    //^ come from server
                    //! go to tagoraa screen
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
                          val = 1;
                        });
                        MyServices.sharedPreferences
                            .setString('branch_code', val.toString());
                      },
                      child: const BranchContainer(
                        img: 'assets/images/branchone.png',
                        text: 'فرع تاجوراء',
                      ),
                    ),
                    //!go to aen zara screen
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
                          val = 2;
                        });
                        MyServices.sharedPreferences
                            .setString('branch_code', val.toString());
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
                    //!go to trablus screen
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
                          val = 3;
                        });
                        MyServices.sharedPreferences
                            .setString('branch_code', val.toString());
                      },
                      child: BranchContainer(
                        img: 'assets/images/branchtwo.png',
                        text: 'فرع ترابلس',
                      ),
                    ),
                    //! go to masarta screen
                    SelectableContainer(
                      selectedBackgroundColorIcon: green,
                      borderRadius: 20,
                      iconColor: offwhite,
                      selectedBorderColor: green,
                      unselectedBorderColor: Color.fromARGB(255, 168, 168, 136),
                      unselectedBackgroundColor: const Color(0xfffefeec),
                      unselectedOpacity: 1,
                      marginColor: offwhite,
                      selected: _select4,
                      onValueChanged: (bool value) {
                        setState(() {
                          _select4 = value;
                          val = 4;
                        });
                        MyServices.sharedPreferences
                            .setString('branch_code', val.toString());
                      },
                      child: BranchContainer(
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
                      val = 5;
                    });

                    MyServices.sharedPreferences
                        .setString('branch_code', val.toString());
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
                      print(MyServices.sharedPreferences
                          .getString('branch_code'));
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => SubCategories()));
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
}
