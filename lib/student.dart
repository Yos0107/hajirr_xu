import 'package:flutter/material.dart';
import 'package:hajirr_xu/login.dart';
import 'package:hajirr_xu/info.dart';
import 'package:table_calendar/table_calendar.dart';

class studentdashboard extends StatefulWidget {
  const studentdashboard({Key? key}) : super(key: key);

  @override
  State<studentdashboard> createState() => _studentdashboardState();
}

class _studentashboardState extends State<studentdashboard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _studentdashboardState extends State<studentdashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Students Dashboard'),
          backgroundColor: Color(0xFF14BDEB),
        ),
        drawer: Drawer(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/gradient_drawer.jpg'),
                        fit: BoxFit.cover)),
                currentAccountPicture: CircleAvatar(
                  child: Text(
                    'YT',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  backgroundColor: Color(0xFF14BDEB),
                ),
                accountName: Text(
                  'Yoseph Tamang',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                accountEmail: Text(
                  'tamang@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.list_rounded,
                  color: Color(0xFF081C15),
                ),
                title: Text(
                  'Attendance History',
                  style: TextStyle(color: Color(0xFF081C15), fontSize: 16),
                ),
                onTap: () => print('Hello'),
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
          ),
        ),
        body: Column(
          children: [
            SafeArea(
                child: TableCalendar(
                    calendarStyle: CalendarStyle(
                        todayTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    firstDay: DateTime.utc(2022, 01, 01),
                    lastDay: DateTime.utc(2025, 01, 01),
                    focusedDay: DateTime.now(),
                    shouldFillViewport: false,
                    headerStyle: HeaderStyle(
                      titleTextStyle: TextStyle(
                          fontSize: 25,
                          color: Color(0xFF081C15),
                          fontWeight: FontWeight.w800),
                    ))),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin');
                },
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Click to Check In',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xFF16DB65),
                    minimumSize: Size(350, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin');
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Attendance History',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xFF16DB65),
                    minimumSize: Size(350, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, 'admin');
                },
                icon: Icon(
                  Icons.leave_bags_at_home,
                  color: Colors.white,
                  size: 22.0,
                ),
                label: Text(
                  'Apply Leave',
                  style: TextStyle(fontSize: 18, letterSpacing: 1),
                ),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Colors.blue,
                    minimumSize: Size(350, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
            SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
