// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class LawyerProfileCard extends StatelessWidget {
  LawyerProfileCard({
    Key? key,
    required this.lawyerName,
    required this.profilePicture,
    // required this.consulationFee,
    required this.onTab,
    required this.city,
    required this.experience,
  }) : super(key: key);
  final String lawyerName;
  final String city;
  final String experience;
  final String profilePicture;
  // final String consulationFee;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.network(
                        profilePicture,
                        height: 75,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lawyerName,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Color(0xff4F7344),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Experience: $experience",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff333333),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "City: $city",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xff333333),
                          ),
                        ),
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
      ),
    );
  }
}
