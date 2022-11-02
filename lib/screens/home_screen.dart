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
      Navigator.pushReplacementNamed(context, '/addService');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/donation');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/more');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        cIndex: 0,
      ),
    );
  }
}
