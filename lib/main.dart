import 'package:flutter/material.dart';
import 'package:hajirr_xu/admin.dart';
import 'package:hajirr_xu/forgot.dart';
import 'package:hajirr_xu/info.dart';
import 'package:hajirr_xu/logic/Models/mysql.dart';
import 'package:hajirr_xu/login.dart';
import 'package:hajirr_xu/register.dart';
import 'package:hajirr_xu/student.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => MyLogin(),
      'register': (context) => MyRegister(),
      'forgot': (context) => ForgotPassword(),
      'student': (context) => studentdashboard(),
      'admin': (context) => admindashboard(),
      'info': (context) => info(),
    },
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var db = new Mysql();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
