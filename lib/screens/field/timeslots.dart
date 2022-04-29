import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/constants/data.dart';
import 'package:futsal_booking/constants/styles.dart';
//import 'package:futsal_booking/controllers/booking_controller.dart';
import 'package:futsal_booking/widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widgets/next_previous_buttons.dart';

class TimeSlots extends StatelessWidget {
  TimeSlots({Key? key}) : super(key: key);
  //final BookingController _bookingController = Get.find();
  var isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: EdgeInsets.only(top: kDefaultPadding * 2),
            child: Column(
              children: [
                Container(
                  color: kLightGreyColor,
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  DateFormat.MMMM().format(
                                      bookingController.bookingForDate.value),
                                  style: blackTextStyle.copyWith(fontSize: 18),
                                ),
                                Text(
                                  '${bookingController.bookingForDate.value.day}',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat.EEEE().format(
                                      bookingController.bookingForDate.value),
                                  style: blackTextStyle.copyWith(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.calendar_today),
                        ),
                        onTap: () => showDatePicker(context),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: TIME_SLOTS.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            bookingController.selectedTimeSlotIndex.value =
                                index;
                            //isSelected = true;
                          },
                          child: Obx(
                            () => Card(
                              color: (bookingController
                                          .selectedTimeSlotIndex.value ==
                                      index)
                                  ? kFluoroscentGreen
                                  : kWhiteColor,
                              child: Center(
                                child: Text(
                                  TIME_SLOTS[index],
                                  style: blackTextStyle.copyWith(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                nextPreviousButtons(
                  bookingController.goToBookingDetailsScreen,
                  bookingController.goToFieldDetailsScreen,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDatePicker(context) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime.now(),
        maxTime: DateTime.now().add(
          Duration(days: 31),
        ), onConfirm: (date) async {
      bookingController.bookingForDate.value = date;
      await bookingController.getBookingsForDate();
    });
  }
}
