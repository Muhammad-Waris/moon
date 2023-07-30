import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/review_order.dart';
import 'package:moon/widgets/app_button.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';

class ChooseTicket extends StatefulWidget {
  const ChooseTicket({super.key});

  @override
  State<ChooseTicket> createState() => _ChooseTicketState();
}

class _ChooseTicketState extends State<ChooseTicket> {
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
          text: "Choose Ticket",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "The San Francisco Fall Show 2019",
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  Row(
                    children: [
                      SvgPicture.string(SvgIcons.calendar),
                      const SizedBox(
                        width: 12,
                      ),
                      const AppText(
                        text: "Sat, Oct 26, 2019 6:00PM - 8:00PM",
                        fontSize: 15,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Early Bird Presale Ticket",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText(
                        text: "Sold out",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const AppText(
                    text: "\$13",
                    fontSize: 13,
                  ),
                  const AppText(
                    text: "Sales end on Sep 13, 2019",
                    fontSize: 13,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      AppText(
                        text: "More",
                        fontSize: 13,
                        color: Color(0xff662FFF),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff707070),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Presale Ticket",
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          AppText(
                            text: "\$25",
                            fontSize: 13,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                text: "1",
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xff707070),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const AppText(
                    text: "Sales end on Sep 13, 2019",
                    fontSize: 13,
                  ),
                  const Row(
                    children: [
                      AppText(
                        text: "More",
                        fontSize: 13,
                        color: Color(0xff662FFF),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff662FFF),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Final Presale Ticket",
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          AppText(
                            text: "\$25",
                            fontSize: 13,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: 44,
                          width: MediaQuery.of(context).size.width * 0.20,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                text: "0",
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Color(0xff707070),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const AppText(
                    text: "Sales end on Sep 13, 2019",
                    fontSize: 13,
                  ),
                  const Row(
                    children: [
                      AppText(
                        text: "More",
                        fontSize: 13,
                        color: Color(0xff662FFF),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff662FFF),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Last Presale Ticket",
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                      AppText(
                        text: "\$50",
                        fontSize: 13,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const AppText(
                    text: "Sales starts on Sep 13, 2019",
                    fontSize: 13,
                    color: Color(0xff662FFF),
                  ),
                  const Row(
                    children: [
                      AppText(
                        text: "More",
                        fontSize: 13,
                        color: Color(0xff662FFF),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Color(0xff662FFF),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 48,
                  width: MediaQuery.of(context).size.width * 0.83,
                  decoration: BoxDecoration(
                    color: const Color(0xff1E233A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Promo Code",
                          color: Color(0xff8A8A8F),
                        ),
                        AppText(
                          text: "Apply",
                          color: Color(0xff662FFF),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  width: MediaQuery.of(context).size.width * 0.80,
                  text: "Order Now",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const ReviewOrder();
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
