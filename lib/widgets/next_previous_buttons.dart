import 'package:flutter/material.dart';
import 'package:futsal_booking/constants/controllers.dart';

import 'custom_button.dart';

Widget nextPreviousButtons(Function nextFunction, Function previousFunction) {
  return Row(
    children: [
      Expanded(
        child: CustomButton(
          text: 'Previous',
          onTap: () => previousFunction,
        ),
      ),
      Expanded(
        child: CustomButton(
          text: 'Next',
          onTap: () => nextFunction,
        ),
      ),
    ],
  );
}
