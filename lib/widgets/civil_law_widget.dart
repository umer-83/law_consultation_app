import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:law_consultation_app/screens/lawyer_portfolio_details.dart';
import 'package:law_consultation_app/widgets/sub_law_category.dart';

Widget civilWidget(lawStream) {
  return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
    stream: lawStream,
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasError) {
        print('Something went Wrong');
      }
      if (snapshot.data == null) {
        print('yo');
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return ListView.builder(
        itemCount: snapshot.data?.docs.length,
        itemBuilder: (context, index) {
          final DocumentSnapshot documentSnap = snapshot.data!.docs[index];

          return (
            SubLawCategoryCard(
            lawTitle: documentSnap['name'].toString(),
            actNum: documentSnap['name'].toString(),
            onTab: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LawyerPortfolioDetails(
                          documentSnapshot: documentSnap)));
            },
          )
          );
        },
      );
    },
  );
}
