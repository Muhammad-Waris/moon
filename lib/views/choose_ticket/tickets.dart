import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:moon/views/choose_ticket/ticket_details.dart';

import '../../constants/appcolors.dart';
import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';

class Tickets extends StatelessWidget {
  const Tickets({super.key});

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
          text: "Tickets",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
            Column(
              children: List.generate(
                  4,
                  (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const TicketDetails();
                        }));
                      },
                      child: const TicketsWidget())),
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17, bottom: 12),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/Image.png",
                width: MediaQuery.of(context).size.width * 0.25,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    text: "Tue, Sep 3",
                    fontSize: 12,
                  ),
                  const AppText(
                    text: "Open Data Science Conference",
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  Row(
                    children: [
                      SvgPicture.string(SvgIcons.drop),
                      const AppText(
                        text: "Hyatt Regency San Fransf A….",
                        fontSize: 13,
                      ),
                    ],
                  ),
                  const AppText(
                    text: "\$30.36",
                    fontSize: 15,
                    color: Color(0xff662FFF),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.59,
                child: const Divider(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
