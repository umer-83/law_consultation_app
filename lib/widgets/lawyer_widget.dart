import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:law_consultation_app/screens/lawyer_portfolio_details.dart';
import 'lawyer_profile_card.dart';

Widget lawyerWidget(lawStream) {
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

          return (LawyerProfileCard(
            lawyerName: '${documentSnap['name'].toString()}',
            // consulationFee: 'Fee: ${documentSnap['email'].toString()}',
            city: documentSnap['city'].toString(),
            experience: documentSnap['yofexp'].toString(),
            profilePicture: documentSnap['cover_image'].toString(),
            onTab: () {
              FocusScope.of(context).unfocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LawyerPortfolioDetails(
                          documentSnapshot: documentSnap)));
            },
          ));
        },
      );
    },
  );
}
