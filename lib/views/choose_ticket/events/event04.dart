import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_button.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_text.dart';
import '../earnings/earnings.dart';

class Event04 extends StatelessWidget {
  const Event04({super.key});

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
          text: "Congratulations",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.defaultPadding,
          child: Column(
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
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xff662FFF))),
                    child: const Center(
                      child: AppText(
                        text: "1",
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
                    decoration: const BoxDecoration(
                      color: Color(0xff662FFF),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Center(
                          child: SvgPicture.string(
                        SvgIcons.purpleflag,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              const AppText(
                text:
                    "Hooray, your event is live now! Don't forget to share with everyone",
                fontSize: 13,
              ),
              const SizedBox(
                height: 15,
              ),
              Image.asset("assets/flagpic.png"),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  AppText(
                    text: "SEP",
                    fontSize: 13,
                    color: Color(0xffFF2D55),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AppText(
                    text: "Rock Health Summit 2019",
                    fontSize: 17,
                  )
                ],
              ),
              Row(
                children: [
                  const AppText(
                    text: "07",
                    fontSize: 17,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.string(SvgIcons.drop),
                      const SizedBox(
                        width: 10,
                      ),
                      const AppText(
                        text: "1015 Folsom, San Francisco, CA",
                        fontSize: 13,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                text: "Edit",
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              AppButton(
                text: "Confirm",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Earnings();
                  }));
                },
              ),
              const SizedBox(
                height: 10,
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
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
