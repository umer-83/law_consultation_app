// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:law_consultation_app/widgets/square_widget.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/label.dart';
import '../widgets/option_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void onChangeNavigation(int index) {
    if (index == 1) {
      Navigator.pushReplacementNamed(context, '/createLawyerProfile');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/lawyerslist');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/more');
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFE9E6E6),
        appBar: AppBar(
          title: const Text(
            "E-Law & Consulatation",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff4F7344),
          elevation: 1,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('assets/images/banner.png'),
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SquareCard(
                      onTab: () {
                        Navigator.pushReplacementNamed(
                            context, '/createLawyerProfile');
                      },
                      title: "Register",
                      subtitle: "Register here as a lawyer!",
                      picture: 'assets/images/add.png',
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SquareCard(
                        onTab: () {
                          Navigator.pushReplacementNamed(
                              context, '/lawyerslist');
                        },
                        title: "Find Lawyer",
                        subtitle: "Find expert lsawyer here!",
                        picture: 'assets/images/lawyer.png'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              LableWidget(title: 'More'),
              SizedBox(height: 10),
              OptionCard(
                optionTitle: "Categories",
                optionImage: 'assets/images/category.png',
                optionSubTitle: "See law categories here!",
                onTab: () {
                  Navigator.pushReplacementNamed(context, '/lawcategory');
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(
          onChange: onChangeNavigation,
          cIndex: 0,
        ),
      ),
    );
  }
}
