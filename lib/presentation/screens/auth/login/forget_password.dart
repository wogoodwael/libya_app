import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/presentation/screens/auth/otp/otp.dart';

import '../../../../api_connection/api_connection.dart';

var emailController = TextEditingController();

checkEMail() async {
  try {
    var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email' : emailController.text.trim()
        }
    );
    if(res.statusCode == 200){
      var resBodyOfCheckEmail = jsonDecode(res.body);
      if (resBodyOfCheckEmail['status'] == "success") {
        Get.to(() => OtpScreen());
        // setState(() {
        //   emailController.clear();
        // });
      } else {
        Get.snackbar('Error', "Email Not found");
      }
    }else{
      if (kDebugMode) {
        print('Unexpected status code: ${res.statusCode}');
        print('Response body: ${res.body}');
      }
    }
  }catch (e) {
    if (kDebugMode) {
      print('forget password error: ${e.toString()}');
    }
  }
}