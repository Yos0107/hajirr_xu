import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/removeStudentControler/removeStudentConroller.dart';

import '../logic/Models/login_controller.dart';

class RemoveStudents extends StatelessWidget {
  RemoveStudents({Key? key}) : super(key: key);

  final removeStudentController = Get.find<RemoveStudentController>();
  printF() {
    print(removeStudentController.listOfStudents);
  }

  @override
  Widget build(BuildContext context) {
    removeStudentController.listOfStudent();
    printF();
    return Scaffold(
        appBar: AppBar(
          title: Text('Students in a class'),
        ),
             body: Obx(() => ListView.builder(
              itemCount: removeStudentController.listOfStudents.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(removeStudentController.listOfStudents[index]),
              ),
            )));
  }
}
