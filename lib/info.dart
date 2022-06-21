import 'package:flutter/material.dart';

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
        title: Text('Info'),
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
      body: Center(
        child: Text('Hello Everyone'),
      ),
    );
  }
}
