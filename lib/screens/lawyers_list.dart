// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:law_consultation_app/widgets/lawyer_widget.dart';

import '../widgets/bottom_navigation_bar.dart';

class LawyersListScreen extends StatefulWidget {
  const LawyersListScreen({Key? key}) : super(key: key);

  @override
  State<LawyersListScreen> createState() => _LawyersListScreenState();
}

class _LawyersListScreenState extends State<LawyersListScreen> {
  void onChangeNavigation(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/createLawyerProfile');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/more');
    }
  }

  Stream lawStream =
      FirebaseFirestore.instance.collection('lawyers').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
        title: const Text(
          "Find Lawyers",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff4F7344),
        elevation: 1,
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'Find lawyer here!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          String searchKey = value;
                          lawStream = FirebaseFirestore.instance
                              .collection('lawyer')
                              .where('name', isGreaterThanOrEqualTo: searchKey)
                              .where('name', isLessThan: searchKey + 'z')
                              .snapshots();
                        });
                      },
                      style: const TextStyle(fontSize: 16),
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(
                          Icons.search,
                          size: 30,
                          color: Color(0xff4F7344),
                        ),
                        contentPadding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                        hintText: 'Search for Lawyer',
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Color(0xff4F7344),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: lawyerWidget(lawStream),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        cIndex: 2,
      ),
    );
  }
}
