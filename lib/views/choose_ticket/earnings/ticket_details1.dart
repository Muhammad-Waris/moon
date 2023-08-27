import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/views/choose_ticket/earnings/payment_method.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/apppadding.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';

class TicketDetails1 extends StatelessWidget {
  const TicketDetails1({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Event",
                    fontSize: 13,
                  ),
                  const AppText(
                    text: "The San Francisco Fall Show 2019",
                    fontSize: 17,
                  ),
                  const AppText(
                    text: "Exhibition",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppText(
                    text: "Date & Time",
                    fontSize: 13,
                  ),
                  const AppText(
                    text: "Monday, October 24",
                    fontSize: 17,
                  ),
                  const AppText(
                    text: "6:00PM - 8:00PM",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Location",
                            fontSize: 13,
                          ),
                          AppText(
                            text: "Fort Mason Center",
                            fontSize: 17,
                          ),
                          AppText(
                            text: "Festival Pavilion, San Francisco, CA",
                            fontSize: 13,
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/Map.png",
                        width: MediaQuery.of(context).size.width * 0.15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppText(
                    text: "Ticket",
                    fontSize: 13,
                  ),
                  const AppText(
                    text: "Presale Ticket",
                    fontSize: 17,
                  ),
                  const AppText(
                    text: "Sales end on Sep 13, 2019",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const AppText(
                    text: "Price",
                    fontSize: 13,
                  ),
                  const AppText(
                    text: "\$30.36",
                    fontSize: 17,
                  ),
                  const AppText(
                    text: "1 x \$25 + \$5.36 (Service fee)",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                    text: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  AppButton(
                    text: "Show QR code",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PaymentMethods(
                          eventData: {},
                          totalAmount: 4,
                        );
                      }));
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
