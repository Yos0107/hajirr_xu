import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/presentStudentController.dart';
// import 'package:hajirr_xu/app/controller/presentStudentController.dart';
import 'package:hajirr_xu/drawer.dart/studentDrawer.dart';
import 'package:hajirr_xu/logic/Models/login_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class StudentDashBoard extends StatelessWidget {
  StudentDashBoard({Key? key}) : super(key: key);
  final PresentStudentController presentStudentController = Get.find<PresentStudentController>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState(){
    showName();
  }
  @override
  Widget build(BuildContext context) {
    
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
              // showName();
                  // isPresent = true;
                  // print(isPresent);
                  updateStatus();
                  Get.snackbar(
                                  "Your Attedance has been recorded successfully",
                                  'Thank you for attending class',
                                  colorText: Colors.white,
                                  icon: Icon(Icons.check, color: Colors.white, size: 35,),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                );
            
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


showName() async {
  // var iCard;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  await _firestore
  .collection('users')
  .where("email address", isEqualTo: email)
  .get()
  .then((value) {
    value.docs.forEach((element) =>{
      // loggedInEmail = element['email address'],
      studentName = element['full name'],
      print(element['full name']),
      print(element.id),
      studentId = element.id
    }   
    );
  });
}
Future<void> updateStatus() async {
                  var stdId = studentId;
                  FirebaseFirestore _firestore = FirebaseFirestore.instance;
                  await _firestore
                  .collection('users')
                  .doc(stdId)
                  .update({
                    'status' : true,
                  });

                  }

