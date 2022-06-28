import 'package:flutter/material.dart';
import 'package:hajirr_xu/logic/Models/login_controller.dart';

class info extends StatefulWidget {
  const info({Key? key}) : super(key: key);

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hajirr Xu'),
        backgroundColor: Color(0xFF14BDEB),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/gradient_drawer.jpg'),
                      fit: BoxFit.cover)),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  'PP',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                backgroundColor: Color(0xFF14BDEB),
              ),
              accountName: Text(
                loggedInUserName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              accountEmail: Text(
                loggedInEmail,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.dashboard,
                  color: Color(0xFF081C15),
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(color: Color(0xFF081C15), fontSize: 16),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'student');
                }),
            ListTile(
                leading: Icon(
                  Icons.list_rounded,
                  color: Color(0xFF081C15),
                ),
                title: Text(
                  'Attendance History',
                  style: TextStyle(color: Color(0xFF081C15), fontSize: 16),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'student');
                }),
            ListTile(
              leading: Icon(
                Icons.info_outline,
                color: Color(0xFF081C15),
              ),
              title: Text(
                'Info',
                style: TextStyle(color: Color(0xFF081C15), fontSize: 16),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'info');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Color(0xFF081C15),
              ),
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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hajirr Xu is manual attendance system where students can mark them presence after the teachers access them for certain period of time\. Students can see their attendance history from their dashboard and teachers can see the attendance history of every student of the class. This is the beta version and will de deployed very soon after feedback and few upgrades. ",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16, height: 1.3),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Have any queries \? \n\Contact me  \n\9861679757",
              style: TextStyle(fontSize: 16, height: 1.3),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
