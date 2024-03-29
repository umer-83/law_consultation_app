// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../typography/semibold_green.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailTextController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF9F9F9),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                        image: AssetImage('assets/images/AppLogo.png'),
                        width: 150,
                        height: 150),
                  ],
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: emailTextController,
                  obscureText: false,
                  enableSuggestions: !false,
                  autocorrect: !false,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(
                            color: Color(0xff4F7344),
                            width: 2,
                          )),
                      contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(
                          color: Color(0xff4F7344),
                          width: 2,
                        ),
                      )),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await auth.sendPasswordResetEmail(
                          email: emailTextController.text,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.message ==
                            'There is no user record corresponding to this identifier. The user may have been deleted.') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.blue,
                              behavior: SnackBarBehavior.floating,
                              elevation: 1,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
                              content: Text(
                                "No record found.",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }

                        if (e.message == 'Given String is empty or null') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              elevation: 1,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
                              content: Text(
                                "E-mail address is required.",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                        if (e.message ==
                            'The email address is badly formatted.') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              behavior: SnackBarBehavior.floating,
                              elevation: 1,
                              margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
                              content: Text(
                                "Invalid email format!",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }

                        print(e.code);
                        print(e.message);
                        emailTextController.clear();
                        // show the snackbar here
                      }
                    },
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xff4F7344),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(
                            color: Color(0xff4F7344),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Want to login?"),
                    const SizedBox(width: 07),
                    GestureDetector(
                      child: SemiBoldGreen(
                        title: 'Login here',
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
