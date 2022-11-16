// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ConstDetails extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const ConstDetails({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  _ConstDetailsState createState() => _ConstDetailsState();
}

class _ConstDetailsState extends State<ConstDetails> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          body: SingleChildScrollView(
            child: SafeArea(
                child: Column(mainAxisSize: MainAxisSize.max, children: [
              Container(
                  child: Row(
                children: [
                  IconButton(
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/pakconstitutuion');
                      },
                      icon: Icon(
                        Icons.arrow_back_rounded,
                      ))
                ],
              )),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.documentSnapshot['title'],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff4F7344),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Chapter",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(widget.documentSnapshot['actno'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff4F7344),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Description",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(widget.documentSnapshot['desc'],
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff4F7344),
                            )),
                        SizedBox(
                          height: 12,
                        ),
                      ]))
            ])),
          )),
    );
  }
}
