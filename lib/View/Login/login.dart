import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hajirr_xu/logic/Models/login_controller.dart';

class MyLogin extends StatefulWidget {
  MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xFFFFFFFC),
                          filled: true,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 18.0, color: Color(0xFF081C15)),
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
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
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
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF14BDEB),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final usercredential =
                                await _firebaseAuth.signInWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text);

                            email = usercredential.user!.email.toString();
                            print(email);
                            print(usercredential);
                            usercredential.user!.emailVerified.toString();
                            Get.snackbar(
                              "Welcome to Hajirr Xu",
                              'Logged in as ' + email.toString(),
                              colorText: Colors.white,
                              icon: Icon(Icons.person, color: Colors.white),
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                            );
                     
                            Get.toNamed('/student');
                            // Navigator.pushNamed(context, 'student');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please Create Account'),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                      },
                      child: Text('Create Account',
                          style: TextStyle(
               
                              fontSize: 18,
                              color: Colors.white))),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'forgot');
                      },
                      child: Text('Forgot Password',
                          style: TextStyle(
                              
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
