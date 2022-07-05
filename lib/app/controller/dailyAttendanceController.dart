import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class GenerateTodaysAttendanceController extends GetxController {
  var readyForAttendance = [].obs;

  final today = DateTime.utc(2021);

  // var readyForAttendance;

  void onInit() {
    super.onInit();
    readyForAttendance();
  }

  readyforAttendance() async {
    print('jenniiiieeeeeee');
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('approveAttendance')
        .where('date', isEqualTo: today)
        .get()
        .then((value) {
      value.docs.forEach((element) => {
            print("worlddddd"),
            readyForAttendance.add(element),
            print(element['takeAttendance']),
            // readyForAttendance = element.
          });
      print('waft company');
    });
  }
}
