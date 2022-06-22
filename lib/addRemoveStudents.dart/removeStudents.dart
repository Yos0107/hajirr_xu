import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/Models/login_controller.dart';

class removeStudents extends StatefulWidget {
  const removeStudents({Key? key}) : super(key: key);

  @override
  State<removeStudents> createState() => _removeStudentsState();
}

class _removeStudentsState extends State<removeStudents> {
  @override
  void initState() {
    super.initState();
    // printList();
    listOfStudent();
    // print(listOfStudents);
  }

  listOfStudent() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    String nam;
    await _firestore.collection('users').get().then((value) {
      value.docs.forEach((element) => {
            nam = element['full name'].toString(),

            // print("herer/.............."),
            // loggedInEmail = element['email address'],
            // loggedInUserName = element['full name'].toString(),
            // loggedInUserName = element['full name'],
            listOfStudents.add(nam),
            // print(nam),

            // print(element['full name'])
          });
      // print(value);
      print("user matched");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // listOfStudents.clear();
  }

  printList() {
    print(listOfStudents[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Students in a class'),
        ),
        // body: Text(""));
        body: ListView.builder(
          itemCount: listOfStudents.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(listOfStudents[index]),
          ),
        ));
  }
}
