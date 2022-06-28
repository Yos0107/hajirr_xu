import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/Student/attendanceHistory.dart';
import 'package:hajirr_xu/View/Login/login.dart';
import 'package:hajirr_xu/View/Login/register.dart';
import 'package:hajirr_xu/app/bindingss/removeStudentBinding.dart';
import 'package:hajirr_xu/info.dart';
import 'package:hajirr_xu/logic/Models/mysql.dart';
import 'package:hajirr_xu/newmain.dart';
import 'View/Admin/admin.dart';
import 'View/Login/forgot.dart';
import 'Student/student.dart';
import 'addRemoveStudents.dart/removeStudents.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: RemoveStudentBinding(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => MyLogin()),
        GetPage(name: '/register', page: () => MyRegister()),
        GetPage(name: '/forgot', page: () => ForgotPassword()),
        GetPage(name: '/student', page: () => StudentDashboard()),
        GetPage(name: '/admin', page: () => admindashboard()),
        GetPage(name: '/info', page: () => info()),
        GetPage(name: '/history', page: () => AttendanceHistory()),
        GetPage(
          name: '/removeStudents',
          page: () => RemoveStudents(),
          bindings: [RemoveStudentBinding()],
        ),
      ],
      // routes: {
      //   'login': (context) => MyLogin(),
      //   'register': (context) => MyRegister(),
      //   'forgot': (context) => ForgotPassword(),
      //   'student': (context) => StudentDashboard(),
      //   'admin': (context) => admindashboard(),
      //   'info': (context) => info(),
      //   'history': (context) => AttendanceHistory(),
      // },
    );
  }
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
