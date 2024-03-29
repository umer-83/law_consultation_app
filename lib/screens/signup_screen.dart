// ignore_for_file: missing_return, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../typography/semibold_green.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController userNameTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email, password, usersname;
  bool remember = false;
  final List<String> errors = [];
// func with named parameter
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

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
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/AppLogo.png'),
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: userNameTextController,
                              obscureText: false,
                              enableSuggestions: !false,
                              autocorrect: !false,
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    borderSide: BorderSide(
                                      color: Color(0xff4F7344),
                                      width: 2,
                                    ),
                                  ),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 15, 15, 15),
                                  labelText: 'Username',
                                  prefixIcon: Icon(
                                    Icons.person,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                      borderSide: BorderSide(
                                        color: Color(0xff4F7344),
                                        width: 2,
                                      ))),
                              // onSaved: (newValue) => usersname = newValue,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Username is required!';
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: emailTextController,
                              obscureText: false,
                              enableSuggestions: !false,
                              autocorrect: !false,
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xff4F7344),
                                    width: 2,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 15, 15, 15),
                                labelText: 'Email',
                                prefixIcon: Icon(
                                  Icons.mail,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xff4F7344),
                                    width: 2,
                                  ),
                                ),
                              ),
                              // onSaved: (newValue) => email = newValue,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Email is required!';
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: passwordTextController,
                              obscureText: true,
                              enableSuggestions: !true,
                              autocorrect: !true,
                              style: const TextStyle(fontSize: 14),
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xff4F7344),
                                    width: 2,
                                  ),
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(15, 15, 15, 15),
                                labelText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  borderSide: BorderSide(
                                    color: Color(0xff4F7344),
                                    width: 2,
                                  ),
                                ),
                              ),
                              // onSaved: (newValue) => password = newValue,
                              onChanged: (value) {
                                if (value.isNotEmpty &&
                                    errors.contains('kPassNullError')) {
                                  removeError(error: 'kPassNullError');
                                } else if (value.length >= 6) {
                                  removeError(error: 'kShortPassError');
                                }
                                // In case a user removed some characters below the threshold, show alert
                                else if (value.length < 6 && value.isNotEmpty) {
                                  addError(error: 'kShortPassError');
                                }
                                return null;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  addError(error: 'kPassNullError');
                                  removeError(error: 'kShortPassError');
                                  return 'Password is required!';
                                } else if (value.length < 6 && value.isNotEmpty) {
                                  addError(error: 'kShortPassError');
                                  return 'Password must be 6 or > 6 digits.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                            email: emailTextController.text,
                                            password: passwordTextController.text)
                                        .then(
                                      (value) {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .add({
                                          'email': emailTextController.text,
                                          'username': userNameTextController.text,
                                          'uid': FirebaseAuth
                                              .instance.currentUser!.uid
                                        });
                                        print("Created New Account");
                                        FocusScope.of(context).unfocus();
                                        Navigator.pushReplacementNamed(
                                            context, '/login');
                                      },
                                    ).onError(
                                      (error, stackTrace) {
                                        print("Error \\\${error.toString()}");
                                      },
                                    );
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
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
                                child: Text(
                                  "Register",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already a user?"),
                            const SizedBox(width: 10),
                            GestureDetector(
                              child: SemiBoldGreen(
                                title: 'Login here',
                              ),
                              onTap: () {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
