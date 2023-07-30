import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:moon/views/splashscreen/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  // options: const FirebaseOptions(  apiKey: "AIzaSyDcS2olwx_1RqNprV-_xIuEr-rNPovz_Dg",
  // authDomain: "moon-f26fd.firebaseapp.com",
  // projectId: "moon-f26fd",
  // storageBucket: "moon-f26fd.appspot.com",
  // messagingSenderId: "440870031135",
  // appId: "1:440870031135:web:245e18b5a22196d6bc6a2a")
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppColors.appBackgroundColor),
      home: const SplashScreen(),
    );
  }
}
