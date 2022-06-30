import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/dailyAttendanceController.dart';

class DailyAttendanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GenerateTodaysAttendanceController());
  }
}
