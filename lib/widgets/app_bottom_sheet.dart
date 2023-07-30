import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/appcolors.dart';
import '../constants/svgicons.dart';

class AppBottomSheet extends StatelessWidget {
  final int currentIndex;
  final void Function(int index)? onIndexChanged;
  const AppBottomSheet({
    Key? key,
    this.currentIndex = 0,
    this.onIndexChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1E233A),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color(0xff1E233A),
          currentIndex: currentIndex,
          onTap: onIndexChanged,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.directions,
                      size: 30,
                      color: currentIndex == 0
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.string(
                      SvgIcons.bottom2,
                      width: 27,
                      color: currentIndex == 1
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.string(
                      SvgIcons.bottom3,
                      width: 25,
                      color: currentIndex == 2
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ],
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.string(
                      SvgIcons.bottom4,
                      width: 22,
                      color: currentIndex == 3
                          ? AppColors.primaryColor
                          : Colors.white,
                    ),
                  ],
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
