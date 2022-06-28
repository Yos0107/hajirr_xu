import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/removeStudentControler/removeStudentConroller.dart';

class RemoveStudentBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<RemoveStudentController>(() => RemoveStudentController());
  }
}
