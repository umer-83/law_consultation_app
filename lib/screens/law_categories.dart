// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:law_consultation_app/widgets/category_widget.dart';

class LawCategories extends StatefulWidget {
  const LawCategories({Key? key}) : super(key: key);

  @override
  State<LawCategories> createState() => _LawCategoriesState();
}

class _LawCategoriesState extends State<LawCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E6E6),
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
          "Law Categories",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xff4F7344),
        elevation: 1,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          CategoryWidget(
            cardTitle: "Criminal Law",
            onTab: () {
              Navigator.pushReplacementNamed(context, '/criminallaw');
            },
            picture: 'assets/images/criminallaw.png',
          ),
          SizedBox(height: 12),
          CategoryWidget(
            cardTitle: "Civil Law",
            onTab: () {
              Navigator.pushReplacementNamed(context, '/civillaw');
            },
            picture: 'assets/images/civillaw.png',
          ),
          SizedBox(height: 12),
          CategoryWidget(
            cardTitle: "Family Law",
            onTab: () {
              Navigator.pushReplacementNamed(context, '/familylaw');
            },
            picture: 'assets/images/familylaw.png',
          ),
          SizedBox(height: 12),
          CategoryWidget(
            cardTitle: "Labour Law",
            onTab: () {
              Navigator.pushReplacementNamed(context, '/labourlaw');
            },
            picture: 'assets/images/labourlaw.png',
          ),
        ],
      ),
    );
  }
}
