import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/widgets/pinput.dart';

import '../constants/appcolors.dart';
import '../constants/apppadding.dart';
import '../constants/svgicons.dart';
import '../views/registeration/login_screen.dart';
import 'app_button.dart';
import 'app_text.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                height: 500,
                width: double.infinity,
                child: Padding(
                  padding: AppPadding.defaultPadding,
                  child: Column(
                    children: [
                      SvgPicture.string(SvgIcons.accountCreated),
                      const SizedBox(
                        height: 11,
                      ),
                      const AppText(
                        text: "Account Created!",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const AppText(
                        text:
                            "We have send you a 5 digits verification code, Please check on your email.",
                        color: AppColors.textColor,
                        textAlign: TextAlign.center,
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const PinPutWidget(),
                      const SizedBox(
                        height: 60,
                      ),
                      AppButton(
                        text: "Verify",
                        onTap: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35)),
                              ),
                              backgroundColor: AppColors.botoombackColor,
                              builder: (builder) {
                                return SizedBox(
                                  height: 440,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: AppPadding.defaultPadding,
                                    child: Column(
                                      children: [
                                        SvgPicture.string(
                                            SvgIcons.accountCreaed2),
                                        const SizedBox(
                                          height: 11,
                                        ),
                                        const AppText(
                                          text: "Account Created!",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const AppText(
                                          text:
                                              "You’ve successfully create an account,Please login before exploring our features! ❤️",
                                          color: AppColors.textColor,
                                          textAlign: TextAlign.center,
                                          fontSize: 14,
                                        ),
                                        const SizedBox(
                                          height: 60,
                                        ),
                                        AppButton(
                                          text: "Login",
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return const LoginScreen();
                                            }));
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                      )
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}
