// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SemiBoldGreen extends StatelessWidget {
  const SemiBoldGreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color(0xff4F7344),
      ),
    );
  }
}
