import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_button.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_text.dart';
import '../../landing_page.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
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
                    ]),
                child: SvgPicture.string(SvgIcons.backbutton)),
          ),
        ),
        title: const AppText(
          text: "Ticket Details",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "Success!",
                  fontSize: 40,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primaryColor, width: 3)),
              child: const Icon(
                Icons.check,
                color: AppColors.primaryColor,
                size: 35,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText(
              text: "Thank you for order",
              fontSize: 24,
            ),
            const SizedBox(
              height: 12,
            ),
            const AppText(
              textAlign: TextAlign.center,
              text:
                  "Thank you for choosing our service to help you find an unforgettable experience",
              fontSize: 17,
            ),
            const Spacer(
              flex: 2,
            ),
            AppButton(
              text: "Show Tickets",
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            AppButton(
              text: "More Events",
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LandingPage();
                }));
              },
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
