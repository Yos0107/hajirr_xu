import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/addRemoveStudents.dart/addStudent.dart';

import 'package:hajirr_xu/drawer.dart/adminDrawer.dart';
import 'package:intl/intl.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);

  // get isStarted => false;

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboard extends StatefulWidget {
  const _admindashboard({Key? key}) : super(key: key);

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text(
          'Admin Dashboard',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Color(0xFF14BDEB),
      ),
      drawer: Drawer(child: adminDrawer()),
      backgroundColor: Color(0xFF22223B),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 40,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AddStudentAlertDialog();
                    },
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Add Students",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  Get.toNamed('/removeStudents');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.person_remove,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Remove Students",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  approveAttendance(
                      // date: DateTime.now()
                      date: DateTime.utc(2022));
                  Get.snackbar(
                    "Attedance Has Been Started",
                    'Students can check in now ',
                    colorText: Colors.white,
                    icon: Icon(Icons.person, color: Colors.white),
                    // snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Color.fromARGB(255, 84, 191, 87),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.play_arrow,
                      color: Colors.green[500],
                      size: 75.0,
                    ),
                    Text(
                      "Start Taking Attendance",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            backgroundColor: Colors.red,
                            title: Text(
                              'Are You Sure?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'register');
                                      },
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'No',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.stop,
                      color: Colors.red,
                      size: 75.0,
                    ),
                    Text(
                      "Stop Taking Attendance",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Generate Todays Attendance",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            title: Text('Are You Sure?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'login');
                                  },
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                            ],
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Future approveAttendance({
    bool startedAttendance = true,
    required DateTime date,
  }) async {
    await FirebaseFirestore.instance.collection('approveAttendance').add({
      'date': date,
      'takeAttendance': startedAttendance,
    });
  }
}
