import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/views/choose_ticket/tickets.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text.dart';

class ReviewOrder extends StatelessWidget {
  const ReviewOrder({super.key});

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
          text: "Review Order",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const ReviewOrderWidget(
              text1: "Ticket",
              text2: "The San Francisco Fall Show 2019",
              text3: "Exhibition",
            ),
            const ReviewOrderWidget(
              text1: "Date & Time",
              text2: "Monday, October 24",
              text3: "6:00PM - 8:00PM",
            ),
            const ReviewOrderWidget(
              text1: "Location",
              text2: "Fort Mason Center",
              text3: "Festival Pavilion, San Francisco, CA 94123",
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Payment Method",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.23,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.apple,
                              color: Colors.black,
                            ),
                            AppText(
                              text: "Pay",
                              color: Colors.black,
                              fontSize: 17,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const AppText(
                        text: "Apple Pay",
                        fontSize: 13,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const AppText(
                    text: "Price",
                    fontSize: 13,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AppText(
                    text: "Presale Ticket",
                    fontSize: 17,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "1 x \$25",
                          fontSize: 13,
                        ),
                        AppText(text: "\$25")
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Service Fee",
                          fontSize: 13,
                        ),
                        AppText(text: "\$5.36")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Total",
                          fontSize: 13,
                        ),
                        AppText(text: "\$30.36")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  width: MediaQuery.of(context).size.width * 0.80,
                  text: "Confirm",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const Tickets();
                    }));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 5,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewOrderWidget extends StatelessWidget {
  final String text1, text2, text3;
  const ReviewOrderWidget({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: text1,
            fontSize: 13,
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: text2,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: Colors.white,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          AppText(
            text: text3,
            fontSize: 13,
          ),
          const SizedBox(
            height: 7,
          ),
          const SizedBox(
            width: double.infinity,
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
