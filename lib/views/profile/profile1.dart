import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/constants/svgicons.dart';
import 'package:moon/widgets/app_text.dart';
import '../../constants/appcolors.dart';
import '../splashscreen/onboarding.dart';
import 'account_settings.dart';
import 'help_center.dart';
import 'notifications.dart';

class Profile1 extends StatefulWidget {
  const Profile1({super.key});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  bool switch4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBackgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff1E233A),
                    )),
                child: Center(
                  child: SvgPicture.string(SvgIcons.setting),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              text: "Settings",
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AccountSettings();
                }));
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff1E233A),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.person_outline_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(text: "Account Settings"),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Color(0xff9496A5),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Notifications();
                }));
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff1E233A),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.notifications,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(text: "Notifications"),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Color(0xff9496A5),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff1E233A),
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.dark_mode_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(text: "Dark Mode"),
                      ],
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
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HelpCenter();
                }));
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff1E233A),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.help_outline_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(text: "Help Center"),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Color(0xff9496A5),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color(0xff1E233A),
                  borderRadius: BorderRadius.circular(30)),
              child: const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.contact_page_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(text: "Tickets"),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Color(0xff9496A5),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                _logout(context);
              },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xff1E233A),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.logout_outlined,
                            color: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppText(
                            text: "Log Out",
                            color: Colors.redAccent,
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Color(0xff9496A5),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();

      // Navigate to the login screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to logout: $error'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }
}
