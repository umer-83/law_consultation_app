// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/bottom_navigation_bar.dart';

class CreateLawyerProfile extends StatefulWidget {
  final bool initialized;
  final bool error;
  final Function? addNewService;
  const CreateLawyerProfile({
    Key? key,
    required this.initialized,
    required this.error,
    this.addNewService,
  }) : super(key: key);

  @override
  _CreateLawyerProfileState createState() => _CreateLawyerProfileState();
}

class _CreateLawyerProfileState extends State<CreateLawyerProfile> {
  bool loading = false;
  File? imageFile;
  List<File> workImageFile = [];
  final picker = ImagePicker();

  FirebaseStorage storage = FirebaseStorage.instance;
  TextEditingController company_name = TextEditingController();
  TextEditingController services = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController quanti = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController fee = TextEditingController();

  bool avail = true;

  Future<void> SelectImageFromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  Future SelectImageOfWork() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        workImageFile.add(File(pickedImage.path));
      });
    }
  }

  Future OnSave() async {
    var service = services.text;
    var phon = phone.text;
    var company_nam = company_name.text;
    var descripton = description.text;
    var addres = address.text;
    var quant = quanti.text;
    var feee = fee.text;
    var cityy =city.text;
    setState(
      () {
        Future.delayed(
          Duration(seconds: 10),
          () {
            Navigator.pushReplacementNamed(context, '/donation');
          },
        );
      },
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saving in Progress..'),
        duration: Duration(seconds: 10),
      ),
    );

    final cover_image = await saveFileToFireBase(imageFile!);

    List<String> portfolio = [];
    if (workImageFile.length > 0) {
      for (var eachFile in workImageFile) {
        String portfolioImageUrl = await saveFileToFireBase(eachFile);
        portfolio.add(portfolioImageUrl);
      }
    }

    return sizes
        .add({
          'userid': FirebaseAuth.instance.currentUser!.uid,
          'address': addres,
          'name': company_nam,
          'cover_image': cover_image.toString(),
          'degrees': portfolio.toList(),
          'expert': descripton,
          'phone': phon,
          'email': quant,
          'yofexp': service,
          'city': cityy,
          'fee': feee,
          
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  CollectionReference sizes = FirebaseFirestore.instance.collection('lawyers');

  Future saveFileToFireBase(File file) async {
    if (file != null) {
      List<String> extensionLists = file.path.split(".");
      String extension = extensionLists.last;
      String fileName = const Uuid().v4();
      try {
        await FirebaseStorage.instance
            .ref('appImages/$fileName.$extension')
            .putFile(File(file.path));

        String fileUrl = await FirebaseStorage.instance
            .ref('appImages/$fileName.$extension')
            .getDownloadURL();

        return fileUrl;
      } on FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
        print("errorsss => $e");
      }
      return 'null';
    }
  }

  void onChangeNavigation(int index) {
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/categories');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/more');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Create Lawyer Profile",
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
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Padding(
              padding: EdgeInsetsDirectional.all(0),
              child: Column(
                children: [
                  if (loading)
                    LinearProgressIndicator(
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  Stack(children: [
                    Container(
                      color: Colors.grey.shade400,
                      width: double.maxFinite,
                      height: 250,
                      child: imageFile != null
                          ? Image.file(imageFile!)
                          : Container(
                              color: Colors.grey,
                              height: 300,
                              child: Center(
                                child: Text(
                                  "Upload Image",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300.withOpacity(.7),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: IconButton(
                              onPressed: SelectImageFromGallery,
                              icon: Icon(
                                Icons.camera_alt,
                                size: 34.0,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: company_name,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'Lawyer Name',
                              labelText: "Lawyer  Name"),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: services,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'Year Of Experience',
                              labelText: "Year Of Experience"),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: phone,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'Phone Number',
                              labelText: "Phone Number"),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: address,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2)),
                            contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                            border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2)),
                            hintText: 'Address',
                            labelText: "Address",
                          ),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: quanti,
                          style: TextStyle(fontSize: 14),
                          minLines: 2,
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'Email',
                              labelText: "Email"),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: description,
                          style: TextStyle(fontSize: 14),
                          minLines: 2,
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'Area Of Expertise',
                              labelText: "Area Of Expertise"),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: fee,
                          style: TextStyle(fontSize: 14),
                          minLines: 2,
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'Fee',
                              labelText: "fee"),
                        ),
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          controller: city,
                          style: TextStyle(fontSize: 14),
                          minLines: 2,
                          maxLines: 5,
                          decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              contentPadding: EdgeInsets.fromLTRB(0, 15, 15, 3),
                              border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blue, width: 2)),
                              hintText: 'City',
                              labelText: "City"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Upload Images of Degree",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              SizedBox(
                                height: 20,
                              ),
                              GridView.count(
                                primary: false,
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                children: [
                                  ...List.generate(
                                    workImageFile.length,
                                    (index) => Container(
                                      width: 100,
                                      height: 100,
                                      clipBehavior: Clip.hardEdge,
                                      child: Image.file(
                                        workImageFile[index],
                                        width: double.maxFinite,
                                        fit: BoxFit.cover,
                                        height: 100,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Colors.grey.shade200,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Tooltip(
                                          message: "Add your photos",
                                          child: IconButton(
                                              onPressed: SelectImageOfWork,
                                              icon: Icon(Icons.add, size: 30)),
                                        )
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    OnSave();
                                  },
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      Color(0xff8C52FF),
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        side: const BorderSide(
                                          color: Color(0xff8C52FF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBarWidget(
        onChange: onChangeNavigation,
        cIndex: 1,
      ),
    );
  }
}