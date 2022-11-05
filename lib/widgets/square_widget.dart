// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class SquareCard extends StatelessWidget {
  SquareCard({
    Key? key,
    required this.onTab,
    required this.title,
    required this.subtitle,
    required this.picture,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String picture;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(70),
                child: Image(
                  image: AssetImage(picture),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xff4F7344),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff333333),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
