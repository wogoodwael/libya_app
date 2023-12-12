import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:libya_bakery/data/models/sign_up_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Services {
  Future postRequest(
      {required String url, required Map<String, dynamic> bodyData}) async {
    http.Response response = await http.post(Uri.parse(url), body: bodyData);
    Map<String, dynamic> data = jsonDecode(response.body);
    try {
      if (response.statusCode == 200) {
        if (data['status'] == 'success') {
          print('Success');
            MyServices.sharedPreferences.setString('id', data['data']['user_id'].toString());
          MyServices.sharedPreferences.setString('first_name', data['data']['first_name']);
          MyServices.sharedPreferences.setString('last_name', data['data']['last_name']);
          MyServices.sharedPreferences.setString('email', data['data']['email']);
          MyServices.sharedPreferences.setString('mobile', data['data']['mobile']);
          MyServices.sharedPreferences.setString('branch_code', data['data']['branch_code'].toString());
          MyServices.sharedPreferences.setString('user_type', data['data']['user_type'].toString());
          SignUpModel signUpModel = SignUpModel.fromJson(data);

          return signUpModel;
        } else {
          print(data);
        }
      } else {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}

class MyServices extends GetxService {
  static late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialService() async {
  await Get.putAsync(() => MyServices().init());
}
