import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/styles.dart';
import '../controllers/image_controller.dart';
import '../helpers/size_config.dart';

class CustomImagePicker extends StatelessWidget {
  const CustomImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageController>(builder: (_picker) {
      return Container(
        // margin: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
        width: SizeConfig.screenWidth * 0.85,
        height: SizeConfig.screenHeight * 0.22,
        decoration: BoxDecoration(
          color: kBlackColor,
          border: Border.all(color: kOrangeColor, width: 3),
        ),
        child: (_picker.pickedImageFile != null)
            ? Image.file(
                _picker.pickedImageFile as File,
                width: double.infinity,
                //height: 200.0,
                fit: BoxFit.fitHeight,
              )
            : Container(
                // margin: EdgeInsets.only(
                //     left: kDefaultPadding, right: kDefaultPadding),
                decoration: BoxDecoration(
                  color: kBlackColor,
                  border: Border.all(color: kOrangeColor, width: 3),
                ),
                width: SizeConfig.screenWidth * 0.85,
                //height: 200,
                height: SizeConfig.screenHeight * 0.22,
                child: Icon(
                  Icons.camera_alt,
                  color: kOrangeColor,
                ),
              ),
      );
    });
  }
}
