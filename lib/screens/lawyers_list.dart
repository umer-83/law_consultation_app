import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:law_consultation_app/widgets/lawyer_widget.dart';

class LawyersListScreen extends StatefulWidget {
  const LawyersListScreen({Key? key}) : super(key: key);

  @override
  State<LawyersListScreen> createState() => _LawyersListScreenState();
}

class _LawyersListScreenState extends State<LawyersListScreen> {
  Stream lawStream = FirebaseFirestore.instance
      .collection('lawyers')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    'Grab free medicine here!',
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
                              .collection('lawyer')
                              .where('name',
                                  isGreaterThanOrEqualTo: searchKey)
                              .where('name', isLessThan: searchKey + 'z')
                              .snapshots();
                        });
                      },
                      style: const TextStyle(fontSize: 13),
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                        hintText: 'Search for Lawyer',
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2)),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: lawyerWidget(lawStream),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
