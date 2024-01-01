import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../core/class/crud.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}