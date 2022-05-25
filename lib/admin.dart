import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hajirr_xu/login.dart';
import 'package:mysql1/mysql1.dart';

class admindashboard extends StatefulWidget {
  const admindashboard({Key? key}) : super(key: key);

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboard extends StatefulWidget {
  const _admindashboard({Key? key}) : super(key: key);

  @override
  State<admindashboard> createState() => _admindashboardState();
}

class _admindashboardState extends State<admindashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(fontSize: 24),
        ),
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
      backgroundColor: Color(0xFF22223B),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 40,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            backgroundColor: Color(0xFF22223B),
                            contentPadding: EdgeInsets.fromLTRB(24, 5, 24, 10),
                            title: Text(
                              'Add Students',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                                  backgroundColor:
                                                      Colors.green[400],
                                                  contentPadding:
                                                      EdgeInsets.fromLTRB(
                                                          10, 5, 10, 0),
                                                  title: Text(
                                                    'New Student has been added successfully',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.pushNamed(
                                                              context, 'admin');
                                                        },
                                                        child: Text(
                                                          'Ok',
                                                          style: TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
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
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.person_add,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Add Students",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            title: Text('Add Students'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Add'))
                            ],
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.person_remove,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Remove Students",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            backgroundColor: Colors.green[400],
                            title: Text(
                              'Students Can Check In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.play_arrow,
                      color: Colors.green[500],
                      size: 75.0,
                    ),
                    Text(
                      "Start Taking Attendance",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context, 'register');
                                      },
                                      child: Text(
                                        'Yes',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
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
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )),
                                ],
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.stop,
                      color: Colors.red,
                      size: 75.0,
                    ),
                    Text(
                      "Stop Taking Attendance",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Generate Todays Attendance",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Color(0xFF4F5D75),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: AlertDialog(
                            title: Text('Are You Sure?'),
                            actions: [
                              TextButton(onPressed: () {}, child: Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('No')),
                            ],
                          ),
                        );
                      });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 75.0,
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
