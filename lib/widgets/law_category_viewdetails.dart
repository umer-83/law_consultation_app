// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CivilLawScreen extends StatefulWidget {
  const CivilLawScreen({Key? key}) : super(key: key);

  @override
  State<CivilLawScreen> createState() => _CivilLawScreenState();
}

class _CivilLawScreenState extends State<CivilLawScreen> {
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
            Navigator.pushReplacementNamed(context, '/lawcategory');
          },
        ),
        title: const Text(
          "Details",
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
          

        ],
      ),
    );
  }
}
