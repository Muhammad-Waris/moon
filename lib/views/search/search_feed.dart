import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/appcolors.dart';
import 'package:moon/constants/svgicons.dart';

import '../../widgets/app_text.dart';

class SearchFeed extends StatelessWidget {
  const SearchFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.appBackgroundColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
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
        title: const AppText(
          text: "Login",
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
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
                child: SvgPicture.string(SvgIcons.flag)),
          ),
        ],
      ),
    );
  }
}
