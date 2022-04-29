import 'package:futsal_booking/constants/asset_path.dart';
import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/controllers/app_controller.dart';
import 'package:futsal_booking/screens/authentication/widgets/bottom_text.dart';
import 'package:futsal_booking/screens/authentication/widgets/login.dart';
import 'package:futsal_booking/screens/authentication/widgets/registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:google_fonts/google_fonts.dart';

import '../../constants/styles.dart';
import '../../controllers/app_controller.dart';
import 'widgets/bottom_text.dart';
import 'widgets/login.dart';
import 'widgets/registration.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlackColor,
      body: Obx(
        () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                kFootball,
                width: double.infinity,
                height: 100,
                fit: BoxFit.contain,
              ),
              Visibility(
                visible: _appController.isLoginWidgetDisplayed.value,
                child: LoginWidget(),
              ),
              Visibility(
                visible: !_appController.isLoginWidgetDisplayed.value,
                child: RegistrationWidget(),
              ),
              const SizedBox(
                height: 10,
              ),
              /** CheckboxListTile Widget **/
              Obx(
                () => CheckboxListTile(
                  title: const Text('Field Owner'),
                  controlAffinity: ListTileControlAffinity.leading,
                  //secondary: const Icon(Icons.code),
                  //autofocus: false,
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(
                      width: 2.0,
                      color: kLightGreyColor,
                    ),
                  ),
                  activeColor: kLightGreyColor,
                  checkColor: kBlackColor,
                  selected: authController.isFieldOwnerChecked.value,
                  value: authController.isFieldOwnerChecked.value,
                  onChanged: (value) {
                    authController.isFieldOwnerChecked.value = value!;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: _appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onTap: () {
                    _appController.changeDisplayedAuthWidget();
                  },
                  text1: "Don\'t have an account?",
                  text2: "Create account!",
                ),
              ),
              Visibility(
                visible: !_appController.isLoginWidgetDisplayed.value,
                child: BottomTextWidget(
                  onTap: () {
                    _appController.changeDisplayedAuthWidget();
                  },
                  text1: "Already have an account?",
                  text2: "Sign in!",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
