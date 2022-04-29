import 'package:futsal_booking/constants/dimens_n_strings.dart';
import 'package:futsal_booking/helpers/size_config.dart';
import 'package:flutter/material.dart';
import '../constants/styles.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? txtColor;
  final Color? bgColor;
  final Color? shadowColor;
  final Function onTap;

  const CustomButton(
      {Key? key,
      required this.text,
      this.txtColor,
      this.bgColor,
      this.shadowColor,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
            color: bgColor ?? kButtonBgColor,
          ),
          child: Container(
            width: SizeConfig.screenWidth * 0.5,
            margin: EdgeInsets.fromLTRB(
              kDefaultPadding + 5,
              kDefaultPadding + 2,
              kDefaultPadding + 5,
              kDefaultPadding + 5,
            ),
            alignment: Alignment.center,
            child: Center(
              child: CustomText(
                text: text,
                color: txtColor ?? kButtonTextColor,
                size: 20,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
