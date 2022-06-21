import 'package:flutter/material.dart';
import 'package:hajirr_xu/View/Login/login.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
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
                    child: Text('Forgot Password',
                        style: TextStyle(
                            color: Color(0xFF14BDEB),
                            fontSize: 33,
                            fontFamily: 'Akshar',
                            fontWeight: FontWeight.w700))),
                Text(
                  'Create New Password',
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
                          hintText: 'Enter Your Email Address',
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Color(0xFF081C15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 22.0,
                        ),
                        label: Text(
                          'Send',
                          style: TextStyle(fontSize: 18, letterSpacing: 1),
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
      ),
    );
  }
}
