import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:futsal_booking/constants/styles.dart';
//import 'package:futsal_booking/controllers/field_owner_controller.dart';
import 'package:futsal_booking/widgets/custom_button.dart';
import 'package:get/get.dart';

import '../../constants/controllers.dart';
//import 'widgets/map.dart';

class FieldOwnerHome extends StatelessWidget {
  User user;
  FieldOwnerHome({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      appBar: AppBar(
        backgroundColor: kYellowColor,
        title: Row(
          children: [
            GestureDetector(
              onTap: authController.signOut,
              child: Text(
                'Logout',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
            text: "Register Field",
            onTap: fieldOwnerController.goToFieldLocationSelection,
          )
        ]),
      ),
    );
  }
}
