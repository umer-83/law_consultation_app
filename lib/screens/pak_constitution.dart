// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:law_consultation_app/widgets/pak_const_widget.dart';

class PakConstitutionScreen extends StatefulWidget {
  const PakConstitutionScreen({Key? key}) : super(key: key);

  @override
  State<PakConstitutionScreen> createState() => _PakConstitutionScreenState();
}

class _PakConstitutionScreenState extends State<PakConstitutionScreen> {
  Stream lawStream =
      FirebaseFirestore.instance.collection('pakconst').snapshots();
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
            "Pakistan Constitution",
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
                      'Find law here!',
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
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            String searchKey = value;
                            lawStream = FirebaseFirestore.instance
                                .collection('pakconst')
                                .where('title',
                                    isGreaterThanOrEqualTo:
                                        searchKey.toUpperCase())
                                .where('title',
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
                          hintText: 'Search for Constitution',
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
                  child: PakConstWidget(lawStream),
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
