import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/constants/styles.dart';

import 'package:futsal_booking/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/dimens_n_strings.dart';
import '../../../helpers/size_config.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kBlackColor,
        boxShadow: [
          BoxShadow(
            color: kBackgroundColor.withOpacity(.5),
            blurRadius: 10,
          )
        ],
        borderRadius: BorderRadius.circular(kBorderRadiusMedium),
      ),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth / 1.2,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusMin),
                  color: kTextFieldFillColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    style: blackTextStyle,
                    controller: authController.email,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SizeConfig.screenWidth / 1.2,
                margin: const EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadiusMin),
                  color: kTextFieldFillColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: TextField(
                    style: blackTextStyle,
                    controller: authController.password,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: "Password",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: CustomButton(
                text: "Login",
                onTap: () {
                  authController.signIn();
                }),
          ),
        ],
      ),
    );
  }
}
