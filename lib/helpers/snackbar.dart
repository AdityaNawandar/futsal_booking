import 'package:get/get.dart';

import '../constants/styles.dart';

class Snackbar {
  static showSnackbar(title, message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      overlayColor: kOrangeColor,
      overlayBlur: 0,
    );
  }
}
