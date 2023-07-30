import 'package:flutter/material.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/registeration/login_screen.dart';
import 'package:moon/views/registeration/register_screen.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_text.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 5,
            ),
            const AppText(
              text: "Discover Event Near By You",
              fontSize: 21,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: AppText(
                color: Color(0xff9496A5),
                text:
                    "Vel ut nunc a sodales tellus nisl. Bibendum arcu feugiat in aenean ultricies ac vulp.",
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RoundedButton(
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: 55,
                  borderColor: Colors.white,
                  text: "Log In",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                ),
                AppButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RegisterScreen();
                    }));
                  },
                  text: "Sign Up",
                  height: 55,
                  width: MediaQuery.of(context).size.width * 0.40,
                )
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
