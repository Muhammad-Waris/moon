import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_text.dart';
import 'event_details_public.dart';

class Earnings extends StatelessWidget {
  const Earnings({super.key});

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
          text: "Earnings",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppText(
                  text: "Upcoming",
                  fontSize: 15,
                ),
                AppText(
                  text: "Previous",
                  fontSize: 15,
                ),
              ],
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const AppText(
              text: "Your Balance",
              fontSize: 15,
            ),
            const AppText(
              text: "\$7, 349.50",
              fontSize: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "Withdraw",
                  fontSize: 15,
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: AppColors.primaryColor,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Image.asset("assets/Chart.png"),
            const SizedBox(
              height: 11,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventDetailsPublic();
                }));
              },
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/86.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Tickets Sold",
                                fontSize: 15,
                              ),
                              AppText(
                                text: "746 / 1000",
                                fontSize: 13,
                              )
                            ],
                          )
                        ],
                      ),
                      const AppText(
                        text: "See More",
                        fontSize: 13,
                        color: AppColors.primaryColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventDetailsPublic();
                }));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/57.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Tickets Sold",
                            fontSize: 15,
                          ),
                          AppText(
                            text: "746 / 1000",
                            fontSize: 13,
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 11,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const EventDetailsPublic();
                }));
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset("assets/43.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "Tickets Sold",
                            fontSize: 15,
                          ),
                          AppText(
                            text: "746 / 1000",
                            fontSize: 13,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: const Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
