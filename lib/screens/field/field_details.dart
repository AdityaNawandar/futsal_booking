import 'package:flutter/material.dart';
import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/widgets/next_previous_buttons.dart';

class FieldDetailsScreen extends StatelessWidget {
  const FieldDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        const Spacer(),
        nextPreviousButtons(
          bookingController.goToTimeSlotsScreen,
          bookingController.goToHomeScreen,
        ),
      ]),
    );
  }
}
