import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hajirr_xu/logic/Models/login_controller.dart';
import 'package:http/http.dart';

class studentDrawer extends StatefulWidget {
  const studentDrawer({Key? key}) : super(key: key);

  @override
  State<studentDrawer> createState() => _studentDrawerState();
}

class _studentDrawerState extends State<studentDrawer> {
  //doc IDs

//get docIDs

  UserData() async {
    // String nam;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection('users')
        .where("email address", isEqualTo: email)
        .get()
        .then((value) {
      value.docs.forEach((element) => {
            print("herer/.............."),
            loggedInEmail = element['email address'],
            loggedInUserName = element['full name'].toString(),
            // listOfStudents.add(nam),
            // loggedInUserName = element['full name'],
            print("email adress"),
            print(element['email address']),
            print(element['full name'])
          });
      print(value);
      print("user matched");
    });
  }

  @override
  void initState() {
    UserData();
    // getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/gradient_drawer.jpg'),
                  fit: BoxFit.cover)),
          currentAccountPicture: CircleAvatar(
            child: Text(
              'YTG',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            backgroundColor: Color(0xFF14BDEB),
          ),
          accountName: Text(loggedInUserName),
          accountEmail: Text(
            loggedInEmail,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
   
        ListTile(
          leading: Icon(Icons.info_outline, color: Color(0xFF081C15)),
          title: Text('Info',
              style: TextStyle(color: Color(0xFF081C15), fontSize: 16)),
          onTap: () {
            Navigator.pushNamed(context, 'info');
          },
        ),
        ListTile(
          leading: Icon(Icons.login, color: Color(0xFF081C15)),
          title: Text(
            'Log Out',
            style: TextStyle(color: Color(0xFF081C15), fontSize: 16),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'login');
          },
        ),
      ],
    );
  }
}
