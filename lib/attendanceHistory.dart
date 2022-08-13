import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/presentStudentController.dart';

import 'app/controller/presentStudentController.dart';


class TodaysAttendance extends StatefulWidget {
  TodaysAttendance({Key? key}) : super(key: key);
  

  @override
  State<TodaysAttendance> createState() => _TodaysAttendanceState();
}

class _TodaysAttendanceState extends State<TodaysAttendance> {
  bool isPresent =false;
  final presentStudentController = Get.find<PresentStudentController>();

  @override
  Widget build(BuildContext context) {
    presentStudentController.presentToday();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todays Attendance"
        ),
        
      ),
      body: Obx(
       () => ListView.separated(
          itemCount: presentStudentController.studentPresentToday.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 0.5,
              height: 0.5,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            var sn = index + 1;
            return Container(
              height: 50,
              padding:  EdgeInsets.symmetric(horizontal: 16),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Text(sn.toString()),
                ),
                Expanded(
                  flex: 8,
                  child: Text(presentStudentController.studentPresentToday[index]['full name'])
                  ),
                  Expanded(
                    flex: 3,
                    // child: Text(presentStudentController.studentPresentToday[index]['value']),
                    child: isPresent == true
                          ? Icon(Icons.check, color: Colors.green,)
                          : Icon(Icons.close, color: Colors.red,)
                  

                    )
              ]),
            );
          },
        ),
      ),
    );
    
  }
}