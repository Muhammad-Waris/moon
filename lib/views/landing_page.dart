import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/appcolors.dart';
import '../controllers/main_page_controller.dart';
import '../widgets/app_bottom_sheet.dart';



class LandingPage extends StatelessWidget {
 final int currentIndex = 0;
  const LandingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MainPageController mainPageController = Get.put(MainPageController());
    mainPageController.currentIndex = currentIndex;
  return ColoredBox(
      color: AppColors.appBackgroundColor,
      child: SafeArea(
        child: GetBuilder<MainPageController>(
          init: MainPageController(),
          builder: (_) {
            return Scaffold(
              body: _.mainScreens[_.currentIndex],
              bottomNavigationBar: AppBottomSheet(
                currentIndex: _.currentIndex,
                onIndexChanged: (index) {
                  _.changeScreen(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
