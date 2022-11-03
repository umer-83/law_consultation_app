// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.cardTitle,
    required this.onTab,
    required this.picture,
  }) : super(key: key);
  final String cardTitle;
  final VoidCallback onTab;
  final String picture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      picture,
                      height: 60,
                      width: 60,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      cardTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color(0xff4F7344),
                        fontWeight: FontWeight.w400,
                      ),
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
      ),
    );
  }
}
