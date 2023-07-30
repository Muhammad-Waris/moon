import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_text.dart';

import '../../constants/svgicons.dart';

class GroupInfopublic extends StatelessWidget {
  const GroupInfopublic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.defaultPadding,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Group Info",
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
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
                      GestureDetector(
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
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SvgPicture.string(SvgIcons.setting),
                            )),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const AppText(
                    text: "Tachno Invasion",
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const AppText(
                    text: "376 Participants",
                    fontSize: 12,
                    color: Color(0xff9496A5),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              width: double.infinity,
              child: Divider(
                thickness: 1,
                color: Color(0xff1E233A),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff343952)),
                      child: const Center(
                        child: AppText(text: "Date:"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff343952)),
                      child: const Center(
                        child: AppText(text: "Location:"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff343952)),
                      child: const Center(
                        child: AppText(text: "Genre:"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff343952)),
                      child: const Center(
                        child: AppText(text: "Info:"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff343952)),
                      child: const Center(
                        child: AppText(text: "Timetable:"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xff343952)),
                      child: const Center(
                        child: AppText(text: "Leave group"),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
