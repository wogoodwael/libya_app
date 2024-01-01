import 'package:get/get.dart';

import '../../admin/core/class/crud.dart';

class MyBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }

}