import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/views/choose_ticket/events/event02.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';

class Event01 extends StatelessWidget {
  const Event01({super.key});

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
          text: "Event Details",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 37,
                    width: 37,
                    decoration: const BoxDecoration(
                      color: Color(0xff662FFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: AppText(text: "1"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xff662FFF),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: const Center(
                      child: AppText(
                        text: "2",
                        color: Color(0xff662FFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xff662FFF),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: const Center(
                      child: AppText(
                        text: "3",
                        color: Color(0xff662FFF),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.10,
                    child: const Divider(
                      thickness: 1,
                      color: Color(0xff662FFF),
                    ),
                  ),
                  Container(
                    height: 37,
                    width: 37,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: Center(
                      child:
                          Center(child: SvgPicture.string(SvgIcons.purpleflag)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const AppText(
                text: "Event Title",
                fontSize: 13,
              ),
              const AppText(
                text: "The San Francisco Fall Show 2019",
                fontSize: 17,
              ),
              const SizedBox(
                height: 12,
              ),
              const AppText(
                text: "Privacy",
                fontSize: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffB8B7BC)),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const AppText(
                        text: "Public Event",
                        fontSize: 17,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 22,
                        width: 22,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const AppText(
                        text: "Private Event",
                        fontSize: 17,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const AppText(
                text: "Event Category",
                fontSize: 13,
              ),
              const Row(
                children: [
                  AppText(
                    text: "Choose Category",
                    fontSize: 17,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white,
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Venue Name",
                fontSize: 13,
              ),
              const AppText(
                text: "Name of the event venue",
                fontSize: 17,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Address",
                fontSize: 13,
              ),
              const AppText(
                text: "Event Address",
                fontSize: 17,
              ),
              const SizedBox(
                height: 14,
              ),
              const AppText(
                text: "Start Date",
                fontSize: 13,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.string(
                        SvgIcons.calendar,
                        color: const Color(0xff8A8A8F),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppText(
                        text: "Sep 21",
                        fontSize: 17,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: Color(0xff8A8A8F), shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const AppText(
                          text: "6:00 PM",
                          fontSize: 17,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const AppText(
                text: "End Date",
                fontSize: 13,
              ),
              const SizedBox(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.string(
                        SvgIcons.calendar,
                        color: const Color(0xff8A8A8F),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const AppText(
                        text: "Day",
                        fontSize: 17,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          decoration: const BoxDecoration(
                              color: Color(0xff8A8A8F), shape: BoxShape.circle),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const AppText(
                          text: "Time",
                          fontSize: 17,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const AppText(
                text: "Event Image",
                fontSize: 13,
              ),
              const AppText(
                text: "Upload up to 5 images",
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/pic.png",
                        width: MediaQuery.of(context).size.width * 0.22,
                      )),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        "assets/pic.png",
                        width: MediaQuery.of(context).size.width * 0.22,
                      )),
                  Container(
                    height: 83,
                    width: MediaQuery.of(context).size.width * 0.22,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: AppColors.primaryColor,
                        ),
                        AppText(
                          text: "Add Image",
                          color: Color(0xff8A8A8F),
                          fontSize: 11,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              const AppText(
                text: "Tap on a photo to select as primary image",
                fontSize: 12,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "Description",
                fontSize: 13,
              ),
              const AppText(
                text: "Describe your event",
                fontSize: 17,
              ),
              const SizedBox(
                height: 17,
              ),
              const AppText(
                text: "FAQ",
                fontSize: 13,
              ),
              const AppText(
                text: "Optional Details",
                fontSize: 17,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppButton(
                    width: MediaQuery.of(context).size.width * 0.80,
                    text: "Next",
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Event02();
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
      ),
    );
  }
}
