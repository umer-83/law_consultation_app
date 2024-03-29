import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:law_consultation_app/screens/about_us_screen.dart';
import 'package:law_consultation_app/screens/civil_law.dart';
import 'package:law_consultation_app/screens/contact_us_screen.dart';
import 'package:law_consultation_app/screens/create_lawyer_profile.dart';
import 'package:law_consultation_app/screens/criminal_law.dart';
import 'package:law_consultation_app/screens/family_law.dart';
import 'package:law_consultation_app/screens/labour_law.dart';
import 'package:law_consultation_app/screens/lawyers_list.dart';
import 'package:law_consultation_app/screens/more_screen.dart';
import 'package:law_consultation_app/screens/pak_constitution.dart';
import 'package:law_consultation_app/screens/user_profile_screen.dart';
import 'screens/home_screen.dart';
import 'screens/law_categories.dart';
import 'screens/login_screen.dart';
import 'screens/reset_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  _RoutesState createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  bool _initialized = false;
  bool _error = false;

  @override
  void initState() {
    super.initState();

    initializeFlutterFire();
  }

  void initializeFlutterFire() async {
    try {
      //Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          FirebaseAuth.instance.currentUser == null ? '/login' : '/home',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/reset': (context) => ResetScreen(),
        '/home': (context) => HomeScreen(),
        '/more': (context) => MoreScreen(),
        '/civillaw': (context) => CivilLawScreen(),
        '/criminallaw': (context) => CriminalLawScreen(),
        '/familylaw': (context) => FamilyLawScreen(),
        '/labourlaw': (context) => LabourLawScreen(),
        '/pakconstitutuion': (context) => PakConstitutionScreen(),
        '/aboutus': (context) => AboutUs(),
        '/userprofile': (context) => ProfileScreen(),
        '/contactus': (context) => ContactUs(),
        '/lawyerslist': (context) => LawyersListScreen(),
        '/lawcategory': (context) => LawCategories(),
        '/createLawyerProfile': (context) => CreateLawyerProfile(
              initialized: _initialized,
              error: _error,
            ),
      },
    );
  }
}
