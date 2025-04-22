import 'package:get/get.dart';

import '../remote/crudnew.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
  Get.put(Crudnew());

  }

}