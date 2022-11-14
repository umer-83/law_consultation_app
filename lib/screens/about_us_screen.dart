// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/more');
            },
          ),
          title: const Text(
            "About Us",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90.0),
                  child: Image.asset(
                    'assets/images/about.png',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "E-Law & Consultation",
                style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xff4F7344),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Text(
                "E-Law & Consultation is an app in which you will find all law field related things under one roof! For further  details and queries contact us at E-Law&Consultation@gmail.com or call us at 0123344556 ",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff333333),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
