import 'package:futsal_booking/screens/authentication/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get.dart';
import 'constants/firebase.dart';
import 'controllers/booking_controller.dart';
import 'controllers/field_controller.dart';
import 'controllers/field_owner_controller.dart';
import 'controllers/app_controller.dart';
import 'controllers/auth_controller.dart';
import 'controllers/image_controller.dart';
import 'controllers/map_controller.dart';
import 'screens/field/timeslots.dart';
import 'screens/field_owner/location_selection.dart';
import 'screens/field_owner/register_field.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlutterConfig.loadEnvVariables();
  await initialization.then((value) {
    Get.lazyPut<AppController>(() => AppController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<FieldController>(() => FieldController());
    Get.lazyPut<MapController>(() => MapController());
    Get.lazyPut<FieldOwnerController>(() => FieldOwnerController());
    Get.lazyPut<ImageController>(() => ImageController());
    Get.lazyPut<BookingController>(() => BookingController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        );
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: appTextTheme),
      home: TimeSlots(),
      getPages: [
        //GetPage(name: '/', page: () => TimeSlots()),
        GetPage(name: '/', page: () => AuthenticationScreen()),
        GetPage(name: '/register_field', page: () => RegisterFieldScreen()),
        GetPage(
            name: '/location_selection',
            page: () => const LocationSelectionScreen()),
      ],
    );
  }
}
