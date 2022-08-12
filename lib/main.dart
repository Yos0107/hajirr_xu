import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/AddRemoveStudents.dart/removeStudents.dart';
import 'package:hajirr_xu/View/Login/login.dart';
import 'package:hajirr_xu/View/Login/register.dart';
import 'package:hajirr_xu/app/bindingss/dailyAttendanceBindings.dart';
import 'package:hajirr_xu/app/bindingss/presentStudent.dart';
import 'package:hajirr_xu/app/bindingss/removeStudentBinding.dart';
import 'package:hajirr_xu/attendanceHistory.dart';
import 'package:hajirr_xu/info.dart';
import 'package:hajirr_xu/logic/Models/mysql.dart';
import 'View/Admin/admin.dart';
import 'View/Login/forgot.dart';
import 'Student/student.dart';


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
        GetPage(name: '/student',page: () => StudentDashBoard(),
            bindings: [PresentStudentBinding()]),
        GetPage(name: '/admin', page: () => admindashboard()),
        GetPage(name: '/info', page: () => info()),
        GetPage(name: '/removeStudents',page: () => RemoveStudents(),
          bindings: [RemoveStudentBinding()],
        ),
        GetPage(name: '/todaysAttendance', page: () => TodaysAttendance(),
          bindings: [PresentStudentBinding()])
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
