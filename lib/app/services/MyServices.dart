import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServicesApp extends GetxService {
  static late SharedPreferences sharedPreferences;

  Future<MyServicesApp> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServiceApp() async {
  await Get.putAsync(() => MyServicesApp().init());
}
