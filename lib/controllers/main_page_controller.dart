
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moon/views/Homescreen/homescreen.dart';
import 'package:moon/views/choose_ticket/choose_ticket.dart';
import 'package:moon/views/community_tab/community_event.dart';
import 'package:moon/views/profile/profile1.dart';



class MainPageController extends GetxController {
  int currentIndex = 0;
  List<Widget> mainScreens = [
  const  HomeScreen1(),
  const  CommunityEvent1(),
  const  ChooseTicket(),
  const  Profile1(),
  ];

  changeScreen(int index) {
    currentIndex = index;
    update();
  }
}
