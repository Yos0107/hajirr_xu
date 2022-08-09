import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/dailyAttendanceController.dart';
import 'package:hajirr_xu/drawer.dart/studentDrawer.dart';
import 'package:hajirr_xu/logic/Models/login_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentDashBoard extends StatelessWidget {
  StudentDashBoard({Key? key}) : super(key: key);

  final dailyAttendanceController =
      Get.find<GenerateTodaysAttendanceController>();
  printF() {
    print(dailyAttendanceController.readyForAttendance);
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    dailyAttendanceController.readyforAttendance();
    printF();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Students Dashboard'),
          backgroundColor: Color(0xFF14BDEB),
        ),
        drawer: Drawer(
          child: studentDrawer(),
        ),
        body: Column(
          children: [
            SafeArea(
                child: TableCalendar(
                    calendarStyle: CalendarStyle(
                        todayTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    firstDay: DateTime.utc(2022, 01, 01),
                    lastDay: DateTime.utc(2025, 01, 01),
                    focusedDay: DateTime.now(),
                    shouldFillViewport: false,
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF081C15),
                          fontWeight: FontWeight.w800),
                    ))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  
                  // addPresentStudents(
                  //   fullName: loggedInUserName );
                  // dailyAttendanceController.readyForAttendance();

                  // print(dailyAttendanceController.readyForAttendance);
                },
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Click to Check In',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xFF16DB65),
                    minimumSize: Size(350, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  // Navigator.pushNamed(context, 'todaysAttendance');
                  Get.toNamed('/todaysAttendance');
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Todays Attendace',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xFF16DB65),
                    minimumSize: Size(350, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin');
                },
                icon: Icon(
                  Icons.leave_bags_at_home,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Apply Leave',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.blue,
                    minimumSize: Size(350, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
          ],
        ));
  }
}

Future addPresentStudents({
  required String fullName
}) async {
  await FirebaseFirestore.instance.collection('presentStudents').add({
    'full name' : fullName
  });

}