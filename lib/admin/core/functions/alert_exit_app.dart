import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp(){
  Get.defaultDialog(
        backgroundColor: Colors.grey,
        title:
          'Log Out',
        middleText: 'Are you sure u want to exit?',
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              )),
          TextButton(
              onPressed: () async{
                exit(0);
              },
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ))
        ],
      );
  return Future.value(true);
}