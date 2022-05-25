import 'package:flutter/material.dart';
import 'package:hajirr_xu/login.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/gradient_curve.jpg'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                'Create New Account',
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
                        hintText: 'Full Name',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Color(0xFF081C15)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        fillColor: Color(0xFFFFFFFC),
                        filled: true,
                        hintText: 'Email Address',
                        hintStyle:
                            TextStyle(fontSize: 18.0, color: Color(0xFF081C15)),
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
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      label: Text('Create Account',
                          style: TextStyle(fontSize: 18, letterSpacing: 1)),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 22.0,
                      ),
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          primary: Color(0xFF16DB65),
                          minimumSize: Size(350, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))))
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
