import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon/constants/svgicons.dart';
import 'package:moon/widgets/app_text.dart';

import '../landing_page.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _splash1State();
}

class _splash1State extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
     FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const OnboardingScreen()));
        });
      } else {
        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        });
      }
    });
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.string(SvgIcons.logo),
              const SizedBox(
                width: 15,
              ),
              const AppText(
                text: "moon",
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )
            ],
          )),
        ],
      ),
    ));
  }
}
