import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libya_bakery/app/controller/user_controller.dart';

import '../../models/user_model.dart';

class UserTypeList extends GetView<UserViewController> {
  const UserTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: controller.userTypes.length,
        itemBuilder: (context, index) {
          return UserTypes(
              i: index,
              userModel: UserModel.fromJson(controller.data[index])
          );
        },
      ),
    );
  }
}

class UserTypes extends GetView<UserViewController> {
  final UserModel userModel;
  final int i;

  const UserTypes({super.key, required this.userModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.changeCat(i, userModel.userType);
      },
      child: Column(
        children: [
          GetBuilder<UserViewController>(
            builder: (controller){
              return Container(
                padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                decoration: controller.selectedCat == i ? const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.red, width: 3)
                    )
                ) : null,
                child: Text(
                  controller.userTypes[i],
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
