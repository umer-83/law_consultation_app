// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

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
  TextEditingController review = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var userName;

    var docId = widget.documentSnapshot.reference.id.toString();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
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
                              ),
                            ),
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
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.documentSnapshot['fee'],
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4F7344),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Area Of Expertise",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Text(
                          widget.documentSnapshot['expert'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4F7344),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Years Of Experience",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Text(
                          widget.documentSnapshot['yofexp'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4F7344),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "City",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        child: Text(
                          widget.documentSnapshot['city'].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff4F7344),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Lawyer Contact",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.documentSnapshot['phone'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4F7344),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "Office Address",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.documentSnapshot['address'].toString(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff4F7344),
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Degree Documents",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff4F7344),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                "See Reviews!",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.documentSnapshot['review'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      widget.documentSnapshot['review'][index]
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          }),
                      SizedBox(height: 20),
                      Container(
                        width: double.maxFinite,
                        height: 50,
                        child: ElevatedButton(
                          child: const Text(
                            'Write a Review!',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff4F7344)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Color(0xff4F7344))))),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return SingleChildScrollView(
                                  child: SafeArea(
                                    child: Container(
                                      height: 400,
                                      color: Colors.white,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 30, 20, 20),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              const Text(
                                                'Please provide your opinion about the lawyer',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 7,
                                              ),
                                              // Row(
                                              //   mainAxisAlignment:
                                              //       MainAxisAlignment.center,
                                              //   children: [
                                              //     RatingBar.builder(
                                              //       initialRating: 3,
                                              //       minRating: 1,
                                              //       direction: Axis.horizontal,
                                              //       allowHalfRating: true,
                                              //       itemCount: 5,
                                              //       itemPadding:
                                              //           EdgeInsets.symmetric(
                                              //               horizontal: 4.0),
                                              //       itemBuilder: (context, _) =>
                                              //           Icon(
                                              //         Icons.star,
                                              //         color: Colors.amber,
                                              //       ),
                                              //       onRatingUpdate: (rating) {},
                                              //     )
                                              //   ],
                                              // ),
                                              SizedBox(height: 40),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextField(
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                  minLines: 5,
                                                  maxLines: 6,
                                                  controller: review,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color(
                                                                    0xff4F7344),
                                                                width: 2)),
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            0, 15, 15, 3),
                                                    border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xff4F7344),
                                                        width: 2,
                                                      ),
                                                    ),
                                                    hintText:
                                                        'Write your review',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 50,
                                              ),
                                              StreamBuilder<
                                                  QuerySnapshot<
                                                      Map<String, dynamic>>>(
                                                stream: FirebaseFirestore
                                                    .instance
                                                    .collection('users')
                                                    .where('uid',
                                                        isEqualTo: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                    .snapshots(),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return CircularProgressIndicator();
                                                  }
                                                  var ds = snapshot.data!.docs;
                                                  String usernm = '';

                                                  for (int i = 0;
                                                      i < ds.length;
                                                      i++) {
                                                    usernm = (ds[i]['username'])
                                                        .toString();
                                                  }
                                                  //child:
                                                  return Container(
                                                    width: double.maxFinite,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        // Navigator.pop(context);

                                                        FirebaseFirestore
                                                            .instance
                                                            .collection(
                                                                "lawyers")
                                                            .doc(docId)
                                                            .update(
                                                          {
                                                            "review": FieldValue
                                                                .arrayUnion(
                                                              [
                                                                "${usernm}: ${review.text}",
                                                              ],
                                                            )
                                                          },
                                                        );
                                                        Navigator
                                                            .pushReplacementNamed(
                                                                context,
                                                                '/lawyerslist');
                                                      },
                                                      child: const Text(
                                                          'Submit Review'),
                                                      style: ButtonStyle(
                                                        padding:
                                                            MaterialStateProperty
                                                                .all<
                                                                    EdgeInsets>(
                                                          EdgeInsets.all(10),
                                                        ),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all<Color>(Color(
                                                                    0xff4F7344)),
                                                        shape:
                                                            MaterialStateProperty
                                                                .all(
                                                          RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30.0),
                                                            side: BorderSide(
                                                              color: Color(
                                                                  0xff4F7344),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
                                  Color(0xff4F7344)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: Color(0xff4F7344))))),
                          onPressed: () {
                            final number =
                                widget.documentSnapshot['phone'].toString();
                            launch('tel://$number');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
