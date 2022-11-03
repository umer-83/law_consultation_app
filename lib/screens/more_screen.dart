// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:law_consultation_app/widgets/more_card_widget.dart';
import '../widgets/bottom_navigation_bar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onChangeNavigation(int index) {
      if (index == 0) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (index == 1) {
        Navigator.pushReplacementNamed(context, '/createLawyerProfile');
      } else if (index == 2) {
        Navigator.pushReplacementNamed(context, '/categories');
      }
    }

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
          "More",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff4F7344),
        elevation: 1,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            MoreCardWidget(
              cardTitle: "About Us",
              iconData: Icons.location_city_outlined,
              onTab: () {
                // Navigator.pushReplacementNamed(context, '/shortage');
              },
            ),
            SizedBox(height: 10),
            MoreCardWidget(
              cardTitle: "Contact Us",
              iconData: Icons.location_city_outlined,
              onTab: () {
                // Navigator.pushReplacementNamed(context, '/shortage');
              },
            ),
            SizedBox(height: 10),
            MoreCardWidget(
              cardTitle: "Logout",
              iconData: Icons.lock,
              onTab: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        cIndex: 3,
      ),
    );
  }
}
