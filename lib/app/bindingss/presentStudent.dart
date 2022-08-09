import 'dart:ffi';

import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/presentStudentController.dart';


class PresentStudentBinding implements Bindings {
  @override
  void dependencies(){
    Get.lazyPut<PresentStudentController>(() => PresentStudentController());
  }
}