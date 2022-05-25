import 'package:flutter/material.dart';
import 'package:hajirr_xu/forgot.dart';
import 'package:hajirr_xu/student.dart';
import 'package:hajirr_xu/admin.dart';

class MyLogin extends StatefulWidget {
  MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/gradient_curve.jpg'),
            fit: BoxFit.contain),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08,
                      right: 25,
                      left: 25),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/logo.png',
                        ),
                      ],
                    ),
                  )),
              Container(
                  child: Text('Hajir Xu',
                      style: TextStyle(
                          color: Color(0xFF14BDEB),
                          fontSize: 33,
                          fontFamily: 'Akshar',
                          fontWeight: FontWeight.w700))),
              Text(
                'Show your presence',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09,
                    right: 25,
                    left: 25),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFC),
                        filled: true,
                        hintText: 'Username',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Color(0xFF081C15)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Color(0xFF14BDEB),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFC),
                        filled: true,
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Color(0xFF081C15)),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xFF14BDEB),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, 'admin');
                      },
                      icon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
                        size: 22.0,
                      ),
                      label: Text(
                        'Login',
                        style: TextStyle(fontSize: 18, letterSpacing: 1),
                      ),
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Color(0xFF16DB65),
                          minimumSize: Size(350, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                  SizedBox(
                    height: 20,
                  ),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'student');
                      },
                      child: Text('Create Account',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.white))),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'forgot');
                      },
                      child: Text('Forgot Password',
                          style: TextStyle(
                              // decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.white)))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
