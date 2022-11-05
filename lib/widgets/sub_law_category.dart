// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SubLawCategoryCard extends StatelessWidget {
  SubLawCategoryCard({
    Key? key,
    required this.onTab,
    required this.lawTitle,
    required this.actNum,
  }) : super(key: key);
  final String lawTitle;
  final String actNum;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/AppLogo.png',
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lawTitle.length > 10
                            ? "${lawTitle.substring(0, 10)}..."
                            : '${lawTitle}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color(0xff4F7344),
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        actNum.length > 10
                            ? "${actNum.substring(0, 10)}..."
                            : '${actNum}',
                        // 'Act No: $actNum',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.chevron_right,
                size: 30,
                color: Color(0xff4F7344),
              )
            ],
          ),
        ),
      ),
    );
  }
}
