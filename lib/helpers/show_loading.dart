import 'package:futsal_booking/constants/dimens_n_strings.dart';
import 'package:flutter/material.dart';
import 'package:futsal_booking/constants/styles.dart';
import 'package:get/get.dart';

showLoading() {
  Get.defaultDialog(
    title: "Loading...",
    content: Center(
        child: CircularProgressIndicator(
      color: kOrangeColor,
    )),
    barrierDismissible: true,
    radius: kBorderRadiusMin,
    backgroundColor: kBlackColor,
  );
}

dismissLoading() {
  Get.back();
}
