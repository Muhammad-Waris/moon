import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/constants/svgicons.dart';
import 'package:moon/views/registeration/register_screen.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_input_field.dart';
import 'package:moon/widgets/app_text.dart';
import '../landing_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isSigningInWithGoogle = false;

  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
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
          text: "Login",
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
                text: "Login",
                isLoading: isLoading,
                onTap: () {
                  _login();
                },
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
                onTap: () {
                  signInWithGoogle();
                },
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
                height: 66,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppText(
                    text: "Don't have an account? ",
                    color: AppColors.textColor,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }));
                    },
                    child: const AppText(
                      text: "Register",
                      color: AppColors.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signInWithGoogle() async {
    setState(() {
      isSigningInWithGoogle = true;
    });
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final googleAuth = await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      await fireStore
          .collection("users")
          .doc(
            userCredential.user!.uid,
          )
          .set({
        "email": userCredential.user!.email,
        "name": userCredential.user!.displayName,
        "imgUrl": userCredential.user!.photoURL,
        "uid": userCredential.user!.uid,
        "dateOfBirth": DateTime.now(),
      });
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return const LandingPage();
      }));
    } catch (e) {
      print("runing $e");
    } finally {
      setState(() {
        isSigningInWithGoogle = false;
      });
    }

    print("object");
  }

  void _login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnackbar("Please fill in all fields");
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _showBottomSheet();
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred, please try again.";

      switch (e.code) {
        case 'user-not-found':
          errorMessage = "User not found. Please check your email.";
          break;
        case 'wrong-password':
          errorMessage = "Invalid password. Please try again.";
          break;
      }

      _showSnackbar(errorMessage);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showBottomSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35)),
        ),
        backgroundColor: AppColors.botoombackColor,
        builder: (builder) {
          return SizedBox(
            height: 550,
            width: double.infinity,
            child: Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                children: [
                  MyModalBottomSheet(),
                ],
              ),
            ),
          );
        });
  }
}

class MyModalBottomSheet extends StatefulWidget {
  @override
  _MyModalBottomSheetState createState() => _MyModalBottomSheetState();
}

class _MyModalBottomSheetState extends State<MyModalBottomSheet> {
  bool switch1 = true;
  bool switch2 = true;
  bool switch3 = true;
  bool switch4 = true;
  bool switch5 = true;
  bool isAgreeButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          const SizedBox(
            height: 22,
          ),
          const AppText(
            text: "Teknologue",
            fontSize: 18,
          ),
          const AppText(
            text: "5 essential rules",
            fontSize: 14,
          ),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: Color(0xff1E233A),
              thickness: 1,
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "1.",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          text:
                              "Book without waiting for the organizer to respond",
                          color: Color(0xff9496A5),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.1,
                    child: Switch(
                      inactiveThumbColor: Colors.white,
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      thumbColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors
                              .primaryColor; // Set active thumb color to pink
                        } else {
                          return Colors
                              .white; // Set inactive thumb color to white
                        }
                      }),
                      trackColor: MaterialStateColor.resolveWith((states) {
                        return const Color.fromARGB(255, 71, 78, 107);
                      }),
                      value: switch1,
                      onChanged: (value) {
                        setState(() {
                          switch1 = value;
                          checkAgreeButtonState();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Color(0xff1E233A),
                  thickness: 1,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "2.",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          text:
                              "Book without waiting for the organizer to respond",
                          color: Color(0xff9496A5),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.1,
                    child: Switch(
                      inactiveThumbColor: Colors.white,
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      thumbColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors
                              .primaryColor; // Set active thumb color to pink
                        } else {
                          return Colors
                              .white; // Set inactive thumb color to white
                        }
                      }),
                      trackColor: MaterialStateColor.resolveWith((states) {
                        return const Color.fromARGB(255, 71, 78, 107);
                      }),
                      value: switch2,
                      onChanged: (value) {
                        setState(() {
                          switch2 = value;
                          checkAgreeButtonState();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Color(0xff1E233A),
                  thickness: 1,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "3.",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          text:
                              "Book without waiting for the organizer to respond",
                          color: Color(0xff9496A5),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.1,
                    child: Switch(
                      inactiveThumbColor: Colors.white,
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      thumbColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors
                              .primaryColor; // Set active thumb color to pink
                        } else {
                          return Colors
                              .white; // Set inactive thumb color to white
                        }
                      }),
                      trackColor: MaterialStateColor.resolveWith((states) {
                        return const Color.fromARGB(255, 71, 78, 107);
                      }),
                      value: switch3,
                      onChanged: (value) {
                        setState(() {
                          switch3 = value;
                          checkAgreeButtonState();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Color(0xff1E233A),
                  thickness: 1,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "4.",
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          text:
                              "Book without waiting for the organizer to respond",
                          color: Color(0xff9496A5),
                        ),
                      ],
                    ),
                  ),
                  Transform.scale(
                    scale: 1.1,
                    child: Switch(
                      inactiveThumbColor: Colors.white,
                      overlayColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      thumbColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.selected)) {
                          return AppColors
                              .primaryColor; // Set active thumb color to pink
                        } else {
                          return Colors
                              .white; // Set inactive thumb color to white
                        }
                      }),
                      trackColor: MaterialStateColor.resolveWith((states) {
                        return const Color.fromARGB(255, 71, 78, 107);
                      }),
                      value: switch4,
                      onChanged: (value) {
                        setState(() {
                          switch4 = value;
                          checkAgreeButtonState();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Color(0xff1E233A),
                  thickness: 1,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              AppButton(
                text: "Agree",
                onTap: () {
                  // Perform action when the Agree button is tapped
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LandingPage();
                  }));
                }, // Disable the button if not all switches are true
              ),
            ],
          ),
        ],
      ),
    );
  }

  void checkAgreeButtonState() {
    setState(() {
      isAgreeButtonEnabled =
          switch1 && switch2 && switch3 && switch4 && switch5;
    });
  }
}
