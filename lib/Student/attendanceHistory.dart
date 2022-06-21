import 'package:flutter/material.dart';

class AttendanceHistory extends StatefulWidget {
  const AttendanceHistory({Key? key}) : super(key: key);

  @override
  State<AttendanceHistory> createState() => HistoryState();
}

class HistoryState extends State<AttendanceHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Attendance History'),
        ),
        body: Center(
          child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.blue),
              child: Center(
                child: Text("hello world"),
              )),
        ));
  }
}
