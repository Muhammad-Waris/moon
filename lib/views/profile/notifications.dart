import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_input_field.dart';

import '../../constants/svgicons.dart';
import '../../widgets/app_text.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
          text: "Notifications",
          fontSize: 14,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Notifications();
                }));
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xff1E233A),
                    )),
                child: Center(
                  child: SvgPicture.string(SvgIcons.setting),
                ),
              ),
            ),
          ),
        ],
      ),
      body:  Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
            AppInputField(
              hintText: "Search..",
              prefixIcon: Icon(Icons.search),
            )
          ],
        ),
      ),
    );
  }
}
