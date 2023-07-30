import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moon/constants/apppadding.dart';
import 'package:moon/widgets/app_input_field.dart';
import 'package:moon/widgets/app_text.dart';

import '../../../constants/appcolors.dart';
import '../../../constants/svgicons.dart';

class NewMessages extends StatelessWidget {
  const NewMessages({super.key});

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
          text: "New Messages",
          fontSize: 14,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: AppPadding.defaultPadding,
        child: Column(
          children: [
             AppInputField(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
            ),
            const SizedBox(
              height: 22,
            ),
            Column(
              children: List.generate(
                  6,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Row(
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Image.asset("assets/profile.png"),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const AppText(text: "Eleoner payne"),
                          ],
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
