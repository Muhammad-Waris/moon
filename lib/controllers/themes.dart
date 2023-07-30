import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxBool isLightMode = true.obs;

  void setLightMode(bool value) {
    isLightMode.value = value;
  }
}
