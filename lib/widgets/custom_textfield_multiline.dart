import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/dimens_n_strings.dart';
import '../constants/styles.dart';
import '../helpers/size_config.dart';

class MultiLineTextField extends StatelessWidget {
  const MultiLineTextField({
    Key? key,
    this.textEditingController,
    this.hintText,
    this.icon,
    this.initialValue,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final String? hintText;
  final Icon? icon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.85,
      //margin: EdgeInsets.only(left: kDefaultPadding, right: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kBorderRadiusMin),
        color: kTextFieldFillColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: TextField(
          style: blackTextStyle.copyWith(fontSize: 16),
          controller: textEditingController,
          cursorHeight: 24,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: kOrangeColor,
            //errorText: validationText,
            contentPadding: EdgeInsets.only(left: 15, top: 10, right: 15),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 3, color: Colors.red),
            ),
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );

    // return TextField(
    //   style: blackTextStyle.copyWith(fontSize: 16),
    //   //initialValue: initialValue.toString(),
    //   minLines: 3,
    //   maxLines: 5,
    //   //controller: textEditingController,
    //   decoration: InputDecoration(
    //     fillColor: kLightYellowColor,
    //     icon: icon,
    //     border: InputBorder.none,
    //     hintText: hintText,
    //   ),
    // );
  }
}
