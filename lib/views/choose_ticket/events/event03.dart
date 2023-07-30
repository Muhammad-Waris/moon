import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text.dart';
import 'event04.dart';

class Event03 extends StatelessWidget {
  const Event03({super.key});

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
          text: "Payment Settings",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
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
                  decoration: const BoxDecoration(
                    color: Color(0xff662FFF),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: AppText(
                      text: "3",
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
            const SizedBox(
              height: 30,
            ),
            const AppText(
              text: "Country",
              fontSize: 13,
            ),
            const Row(
              children: [
                AppText(
                  text: "United Satates",
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
            const SizedBox(
              height: 30,
            ),
            const AppText(
              text: "Currency",
              fontSize: 13,
            ),
            const Row(
              children: [
                AppText(
                  text: "Us Doolars \$",
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
            const Spacer(),
            AppButton(
              text: "Preview",
              onTap: () {},
              width: MediaQuery.of(context).size.width * 0.80,
            ),
            const SizedBox(
              height: 20,
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
                      return const Event04();
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
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
