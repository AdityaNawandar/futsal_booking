import 'package:get/get.dart';

class BookingController extends GetxController {
  static BookingController instance = Get.find();
  Rx<DateTime> bookingForDate = DateTime.now().obs;
  Rx<int> selectedTimeSlotIndex = 0.obs;

  getBookingsForDate() {
    //fieldsCollection.doc(fieldId)
  }

  goToFieldDetailsScreen() {
    Get.toNamed('/field_details');
  }

  goToBookingDetailsScreen() {
    Get.toNamed('/bookings');
  }

  goToHomeScreen() {
    Get.back();
  }

  goToTimeSlotsScreen() {
    Get.toNamed('/timeslots');
  }
}
