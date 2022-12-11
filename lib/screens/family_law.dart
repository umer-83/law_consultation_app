// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/family_widget.dart';

class FamilyLawScreen extends StatefulWidget {
  const FamilyLawScreen({Key? key}) : super(key: key);

  @override
  State<FamilyLawScreen> createState() => _FamilyLawScreenState();
}

class _FamilyLawScreenState extends State<FamilyLawScreen> {
  Stream lawStream =
      FirebaseFirestore.instance.collection('family').snapshots();
      String dropdownValue = 'title';
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
              Navigator.pushReplacementNamed(context, '/lawcategory');
            },
          ),
          title: const Text(
            "Family Law",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xff4F7344),
          elevation: 1,
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'Find family law here!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButton<String>(
                  isExpanded: false,
                  underline: SizedBox(),
                  value: dropdownValue,
                  hint: Text(
                    "Select",
                    style: TextStyle(color: Colors.black),
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'title',
                    'subtitle',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            String searchKey = value;
                            lawStream = FirebaseFirestore.instance
                                .collection('family')
                                .where(dropdownValue,
                                    isGreaterThanOrEqualTo:
                                        searchKey.toUpperCase())
                                .where(dropdownValue,
                                    isLessThan: searchKey + '\uf8ff')
                                .snapshots();
                          });
                        },
                        style: const TextStyle(fontSize: 16),
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(
                            Icons.search,
                            size: 30,
                            color: Color(0xff4F7344),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(15, 8, 15, 8),
                          hintText: 'Search for Family Law',
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Color(0xff4F7344),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: familyWidget(lawStream),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
