import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/logic/Models/login_controller.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _sectionController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _fullNameController.dispose();
    _sectionController.dispose();
  }

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
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: _fullNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Full Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xFFFFFFFC),
                          filled: true,
                          hintText: 'Full Name',
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Color(0xFF081C15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your valid email address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xFFFFFFFC),
                          filled: true,
                          hintText: 'Email Address',
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Color(0xFF081C15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter strong password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          fillColor: Color(0xFFFFFFFC),
                          filled: true,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Color(0xFF081C15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _sectionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the name of your section';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xFFFFFFFC),
                          filled: true,
                          hintText: 'Section',
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Color(0xFF081C15)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                await _firebaseAuth
                                    .createUserWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text);
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                Get.snackbar(
                                  "Your Account has been created successfully",
                                  ' Now you can take attendance',
                                  colorText: Colors.white,
                                  icon: Icon(Icons.person, color: Colors.white),
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.green,
                                );
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //     content: Text(
                                //         'Account has been created Successfully'),
                                //     backgroundColor: Colors.green,
                                //     behavior: SnackBarBehavior.floating,
                                //   ),
                                // );
                                addUserDetails(
                                  fullName: _fullNameController.text.trim(),
                                  section: _sectionController.text.trim(),
                                  emailAddress: emailController.text.trim(),
                                );

                                Navigator.pushNamed(context, 'login');
                              }
                            }
                          },
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
                                  borderRadius: BorderRadius.circular(20)))),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future addUserDetails(
    {required String fullName,
    required String section,
    required String emailAddress}) async {
  await FirebaseFirestore.instance.collection('users').add({
    'email address': emailAddress,
    'full name': fullName,
    'section': section,
  }
  );
}

