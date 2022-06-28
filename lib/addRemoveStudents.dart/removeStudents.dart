import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/app/controller/removeStudentControler/removeStudentConroller.dart';
import 'package:http/http.dart';

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
      //  body: Obx(() => ListView.builder(
      //   itemCount: removeStudentController.listOfStudents.length,
      //   itemBuilder: (context, index) => ListTile(
      //     title: Text(removeStudentController.listOfStudents[index]),
      //   ),

      // )
      // )
      body: Obx(
        () => ListView.separated(
          itemCount: removeStudentController.listOfStudents.length,
          itemBuilder: (context, index) {
            var sn = index + 1;
            return Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(sn.toString()),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(removeStudentController.listOfStudents[index]
                        ['full name']),
                  ),
                  Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          child: Text('Remove'),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.snackbar(
                                                    "${removeStudentController.listOfStudents[index]['full name']}",
                                                    "Has been removed from the class",
                                                    colorText: Colors.white,
                                                    icon: Icon(Icons.person,
                                                        color: Colors.white),
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    backgroundColor:
                                                        Colors.green,
                                                  );
                                                  var id =
                                                      removeStudentController
                                                          .listOfStudents[index]
                                                          .id;
                                                  FirebaseFirestore.instance
                                                      .collection('users')
                                                      .doc(id)
                                                      .delete();
                                                  removeStudentController
                                                      .listOfStudents
                                                      .removeAt(index);

                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Yes',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      )),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 0.5,
              height: 0.5,
            );
          },
        ),
      ),
    );
  }
}
