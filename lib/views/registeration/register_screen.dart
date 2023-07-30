import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moon/views/landing_page.dart';

import '../../constants/appcolors.dart';
import '../../constants/apppadding.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_input_field.dart';
import '../../widgets/app_text.dart';
import '../registeration/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _registerUser() async {
    final String fullName = _fullnameController.text.trim();
    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;

    if (fullName.isEmpty ||
        username.isEmpty ||
        email.isEmpty ||
        password.isEmpty) {
      _showSnackbar('Please fill in all fields.');
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final String uid = userCredential.user!.uid;

      // Save user data to Firestore
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'fullName': fullName,
        'username': username,
        'email': email,
        "uid":uid,
      });

      _showSnackbar('User registered successfully.');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'An error occurred. Please try again later.';
      if (e.code == 'weak-password') {
        errorMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The account already exists for that email.';
      }
      _showSnackbar(errorMessage);
    } catch (e) {
      _showSnackbar('An error occurred. Please try again later.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.primaryColor, content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              color: Color(0xff1E222E),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 36, 35, 35),
                  blurRadius: 2,
                )
              ],
            ),
            child: SvgPicture.string(SvgIcons.backbutton),
          ),
        ),
        title: const AppText(
          text: "Register",
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
              height: 35,
              width: 35,
              decoration: const BoxDecoration(
                color: Color(0xff1E222E),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 36, 35, 35),
                    blurRadius: 2,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SvgPicture.string(SvgIcons.flag),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              AppInputField(
                hintText: "Full Name",
                upperText: "Enter your full name",
                controller: _fullnameController,
              ),
              AppInputField(
                hintText: "Username",
                upperText: "Enter your username",
                controller: _usernameController,
              ),
              AppInputField(
                hintText: "Enter your email",
                upperText: "Email or Phone Number",
                controller: _emailController,
              ),
              AppInputField(
                hintText: "Enter your password",
                controller: _passwordController,
                upperText: "Password",
                obscureText: true,
                suffixIcon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AppButton(
                isLoading: _isLoading,
                text: "Create Account",
                onTap: _registerUser,
              ),
              const SizedBox(
                height: 22,
              ),
              const AppText(
                text: "Or using other method",
                color: AppColors.textColor,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundedButton(
                text: "Sign In With Google",
                borderColor: Colors.white,
                onTap: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedButton(
                text: "Sign In With Facebook",
                borderColor: Colors.white,
                onTap: () {},
              ),
              const SizedBox(
                height: 44,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                    text: "Have an Account? ",
                    color: AppColors.textColor,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    child: const AppText(
                      text: "Login",
                      color: AppColors.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
