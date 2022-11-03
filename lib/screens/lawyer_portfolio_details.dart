// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class LawyerPortfolioDetails extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;
  const LawyerPortfolioDetails({
    Key? key,
    required this.documentSnapshot,
  }) : super(key: key);

  @override
  _LawyerPortfolioDetailsState createState() => _LawyerPortfolioDetailsState();
}

class _LawyerPortfolioDetailsState extends State<LawyerPortfolioDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E6E6),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Column(mainAxisSize: MainAxisSize.max, children: [
            Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 4.0), //(x,y)
                        blurRadius: 10.0,
                      ),
                    ]),
                width: double.maxFinite,
                height: 350,
                child: Stack(
                  children: [
                    Image.network(widget.documentSnapshot['cover_image'],
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                        height: 350),
                    Row(
                      children: [
                        IconButton(
                            color: Colors.black,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_rounded,
                            ))
                      ],
                    )
                  ],
                )),
            Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.documentSnapshot['name'],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff4F7344),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Email:",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.documentSnapshot['email'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4F7344),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Fee:",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.documentSnapshot['fee'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4F7344),
                        )),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Area Of Expertise",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Container(
                      child: Text(widget.documentSnapshot['expert'].toString(),
                          style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Years Of Experience",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Container(
                      child: Text(widget.documentSnapshot['yofexp'].toString(),
                          style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("City",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 8),
                    Container(
                      child: Text(widget.documentSnapshot['city'].toString(),
                          style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Lawyer Contact",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Text(widget.documentSnapshot['phone'].toString(),
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 12,
                    ),
                    Text("Office Address",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Text(widget.documentSnapshot['address'].toString(),
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(height: 12),
                    Text("Degree Documents",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    GridView.count(
                      primary: false,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      children: List.generate(
                        widget.documentSnapshot['degrees'].length,
                        (index) => Container(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            widget.documentSnapshot['degrees'][index]
                                .toString(),
                            width: double.maxFinite,
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                          child: const Text(
                            'Contact Me!',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff4F7344),
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                        color: Color(0xff4F7344),
                                      )))),
                          onPressed: () {}),
                    )
                  ],
                ))
          ])),
        ));
  }
}
