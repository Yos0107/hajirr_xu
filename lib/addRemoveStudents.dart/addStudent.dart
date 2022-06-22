import 'package:flutter/material.dart';

class AddStudentAlertDialog extends StatelessWidget {
  const AddStudentAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        backgroundColor: Color(0xFF22223B),
        contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        title: Text(
          'Add Students',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFFFFFFC),
                filled: true,
                hintText: 'Full Name',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Color(0xFF081C15)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFFFFFFC),
                filled: true,
                hintText: 'Email',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Color(0xFF081C15)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Color(0xFFFFFFFC),
                filled: true,
                hintText: 'Password',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Color(0xFF081C15)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                fillColor: Color(0xFFFFFFFC),
                filled: true,
                hintText: 'Section',
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    color: Color(0xFF081C15)),
              ),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              backgroundColor: Colors.green[400],
                              contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 0),
                              title: Text(
                                'New Student has been added successfully',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, 'admin');
                                    },
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ))
                              ],
                            ),
                          );
                        });
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
