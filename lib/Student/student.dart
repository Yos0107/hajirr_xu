import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hajirr_xu/drawer.dart/studentDrawer.dart';

import 'package:table_calendar/table_calendar.dart';

class StudentDashboard extends StatefulWidget {
  const StudentDashboard({Key? key}) : super(key: key);

  @override
  State<StudentDashboard> createState() => dashboard();
}

class dashboard extends State<StudentDashboard> {
//doc IDs
  List<String> docIDs = [];
//get docIDs
  // Future getDocId() async {
  //   await FirebaseFirestore.instance
  //       .collection('users')
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((document) {
  //             print(document.reference);
  //             docIDs.add(document.reference.id);
  //           })
  //           );
  // }


  @override
  void initState() {
    // getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: false,
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
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            backgroundColor: Colors.green[400],
                            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                            title: Text(
                              'Your attendance has been recorded successfully',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      });
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
                  Navigator.pushNamed(context, 'history');
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Attendance History',
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
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
