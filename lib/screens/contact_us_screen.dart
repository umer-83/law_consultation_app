import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
            "Contact Us",
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
          children: [],
        ),
      ),
    );
  }
}
