// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PakConstitutionScreen extends StatefulWidget {
  PakConstitutionScreen({Key? key}) : super(key: key);
  final Uri _url = Uri.parse('https://flutter.dev');

  @override
  State<PakConstitutionScreen> createState() => _PakConstitutionScreenState();
}

class _PakConstitutionScreenState extends State<PakConstitutionScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE9E6E6),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
          ),
          title: const Text(
            "Pakistan Constitutions",
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Find more about pak consitituion!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Want to see Constitution of Islmaic Republic Of Pakistan? Click the button!",
                textAlign: TextAlign.center,
                maxLines: 6,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _launchURL,
                  child: Text(
                    "Click Here!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xff4F7344),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(
                          color: Color(0xff4F7344),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url =
      'https://pakistancode.gov.pk/new/UY2FqaJw1-apaUY2Fqa-apaUY2Fvbpw%3D-sg-jjjjjjjjjjjjj';
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
  } else {
    throw 'Could not launch $url';
  }
}



// // ignore_for_file: prefer_const_constructors

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:law_consultation_app/widgets/more_card_widget.dart';

// class PakConstitutionScreen extends StatelessWidget {
//   const PakConstitutionScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
      // onWillPop: () async {
      //   return false;
      // },
//       child: Scaffold(
//         backgroundColor: Color(0xFFE9E6E6),
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//               size: 30,
//             ),
//             onPressed: () {
//               Navigator.pushReplacementNamed(context, '/home');
//             },
//           ),
//           title: const Text(
//             "Pak Constitution",
//             style: TextStyle(
//               fontSize: 20,
//               color: Colors.white,
//             ),
//           ),
//           backgroundColor: const Color(0xff4F7344),
//           elevation: 1,
//           centerTitle: true,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               SizedBox(height: 30),
//               MoreCardWidget(
//                 cardTitle: "Profile",
//                 iconData: Icons.person,
//                 onTab: () {
//                   Navigator.pushReplacementNamed(context, '/userprofile');
//                 },
//               ),
//               SizedBox(height: 10),
//               MoreCardWidget(
//                 cardTitle: "About Us",
//                 iconData: Icons.web,
//                 onTab: () {
//                   Navigator.pushReplacementNamed(context, '/aboutus');
//                 },
//               ),
//               SizedBox(height: 10),
//               MoreCardWidget(
//                 cardTitle: "Contact Us",
//                 iconData: Icons.call,
//                 onTab: () {
//                   Navigator.pushReplacementNamed(context, '/contactus');
//                 },
//               ),
//               SizedBox(height: 10),
//               MoreCardWidget(
//                 cardTitle: "Logout",
//                 iconData: Icons.lock,
//                 onTab: () {
//                   FirebaseAuth.instance.signOut();
//                   Navigator.pushReplacementNamed(context, '/login');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
