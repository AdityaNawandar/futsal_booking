import 'package:flutter/material.dart';

import '../constants/controllers.dart';
import '../constants/dimens_n_strings.dart';
import '../constants/styles.dart';
import '../helpers/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key, required this.hintText, this.icon, this.textEditingController})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String hintText;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.85,
          margin: EdgeInsets.only(
            top: 30,
            // left: kDefaultPadding,
            // right: kDefaultPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadiusMin),
            color: kTextFieldFillColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              style: TextStyle(color: kBlackColor, fontSize: 18),
              controller: textEditingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15, right: 15),
                icon: icon,
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
