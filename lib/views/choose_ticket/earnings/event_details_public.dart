import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/earnings/ticket_details1.dart';
import 'package:moon/widgets/app_button.dart';
import 'package:moon/widgets/app_text.dart';

import '../../../constants/svgicons.dart';

class EventDetailsPublic extends StatelessWidget {
  const EventDetailsPublic({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset("assets/Slide.png"),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 410),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.appBackgroundColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: AppPadding.defaultPadding,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: AppColors.primaryColor,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      AppText(
                                        text: "Available",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  const AppText(
                                    text: "The San Francisco Fall Show 2019",
                                    fontSize: 34,
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("assets/userpicture.png"),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const AppText(
                                            text: "Create Future",
                                            fontSize: 13,
                                          ),
                                        ],
                                      ),
                                      AppButton(
                                        text: "Follow",
                                        onTap: () {},
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.22,
                                        borderradius: BorderRadius.circular(8),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.string(SvgIcons.calendar),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const AppText(
                                        text: "Sat, Oct 26, 2019",
                                        fontSize: 17,
                                      )
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      AppText(
                                        text: "6:00PM - 8:00PM",
                                        fontSize: 15,
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      AppText(
                                        text: "Add to calendar",
                                        fontSize: 15,
                                        color: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.string(
                                        SvgIcons.drop,
                                        height: 20,
                                        color: const Color(0xff8A8A8F),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const AppText(
                                        text: "Fort Mason Center",
                                        fontSize: 17,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 25,
                                        ),
                                        AppText(
                                          text:
                                              "Festival Pavilion, San Francisco, CA 94123",
                                          fontSize: 14,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      AppText(
                                        text: "View map",
                                        fontSize: 15,
                                        color: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Row(
                                    children: [
                                      AppText(
                                        text: "Description",
                                        fontSize: 17,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 7,
                                  ),
                                  const AppText(
                                    text:
                                        "The San Francisco Fall Show, the annual benefit for the 50 year old nonprofit Enterprise for Youth, is held at Fort Mason Center for Arts & Culture each fall, presenting the fin….read more",
                                    fontSize: 15,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const AppText(
                                    text: "Location",
                                    fontSize: 17,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      SvgPicture.string(SvgIcons.loaction),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      const AppText(
                                        text: "Leipzig, Germany",
                                        fontSize: 17,
                                      )
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 22,
                                      ),
                                      AppText(
                                        text: "Nice Address",
                                        fontSize: 13,
                                        color: Color(0xff8A8A8F),
                                      ),
                                    ],
                                  ),
                                  const Row(
                                    children: [
                                      SizedBox(
                                        width: 22,
                                      ),
                                      AppText(
                                        text: "View map",
                                        fontSize: 15,
                                        color: AppColors.primaryColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText(
                                        text: "Events You May like",
                                        fontSize: 18,
                                      ),
                                      Row(
                                        children: [
                                          AppText(
                                            text: "See all",
                                            fontSize: 13,
                                            color: AppColors.primaryColor,
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: AppColors.primaryColor,
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                        children: List.generate(
                                            3,
                                            (index) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: Container(
                                                    height: 220,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.60,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Image.asset(
                                                            "assets/pics.png"),
                                                        const AppText(
                                                          text:
                                                              "Rock Health Summit 2019",
                                                          fontSize: 15,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SvgPicture.string(
                                                              SvgIcons.drop,
                                                              height: 20,
                                                            ),
                                                            const SizedBox(
                                                              width: 8,
                                                            ),
                                                            const AppText(
                                                              text:
                                                                  "1015 Folsom, San Francisco, CA",
                                                              fontSize: 12,
                                                            ),
                                                          ],
                                                        ),
                                                        const AppText(
                                                          text:
                                                              "Starts at \$25",
                                                          fontSize: 13,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ))),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const SizedBox(
                              width: double.infinity,
                              child: Divider(
                                color: Colors.white,
                                thickness: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Padding(
                              padding: AppPadding.defaultPadding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    children: [
                                      AppText(
                                        text: "\$15 - \$50",
                                        fontSize: 15,
                                      ),
                                      AppText(
                                        text: "Only in the app",
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                  AppButton(
                                    text: "Tickets",
                                    width: MediaQuery.of(context).size.width *
                                        0.22,
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const TicketDetails1();
                                      }));
                                    },
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 66,
                            ),
                          ],
                        ),
                      ),
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
}
