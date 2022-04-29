import 'package:flutter/material.dart';
import 'package:futsal_booking/widgets/custom_button.dart';
import 'package:get/get.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text('Field Name'),
        Text('Date Booked For'),
        Text('Charges'),
        Text('Timeslot'),
        Text('Regitered Team'),
        Spacer(),
        CustomButton(text: 'Book', onTap: () => goToPaymentsPage())
      ]),
    );
  }

  goToPaymentsPage() {
    Get.toNamed('/payment_screen');
  }
}
