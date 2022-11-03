// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onChangeNavigation(int index) {
    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/createLawyerProfile');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/donation');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/more');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E6E6),
      appBar: AppBar(
        title: const Text(
          "E-Law & Consulatation",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff4F7344),
        elevation: 1,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        cIndex: 0,
      ),
    );
  }
}
