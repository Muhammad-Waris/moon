import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/constants/svgicons.dart';
import 'package:moon/views/community_tab/inbox_public.dart';
import 'package:moon/widgets/app_text.dart';

class CommunityEvent1 extends StatelessWidget {
  const CommunityEvent1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Row(
              children: [
                AppText(
                  text: "Community",
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primaryColor),
                        child: const Center(
                          child: AppText(
                            text: "Private",
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.22,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black)),
                      child: Center(
                        child: SvgPicture.string(SvgIcons.buttonprivate),
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width * 0.40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.primaryColor),
                        child: const Center(
                          child: AppText(
                            text: "Public",
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.22,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.string(SvgIcons.globe),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            const Row(
              children: [
                AppText(
                  text: "Your Communities",
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            const SizedBox(
              height: 22,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return InboxCommunityPublic();
                }));
              },
              child: Container(
                width: double.infinity,
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 18),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                                color: Color(0xff1E233A),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: const Divider(
                        color: Color(0xff707070),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 22),
                          child: AppText(
                            text: "28 February 2020 8:30 am",
                            color: Color(0xff9496A5),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
