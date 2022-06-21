import 'package:flutter/material.dart';

class adminDrawer extends StatefulWidget {
  const adminDrawer({Key? key}) : super(key: key);

  @override
  State<adminDrawer> createState() => _adminDrawerState();
}

class _adminDrawerState extends State<adminDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              leading: Icon(Icons.info_outline, color: Color(0xFF081C15)),
              title: Text('Info',
                  style: TextStyle(color: Color(0xFF081C15), fontSize: 16)),
              onTap: () {
                Navigator.pushNamed(context, 'info');
              },
            ),
          ],
        ),
      ),
    );
  }
}
