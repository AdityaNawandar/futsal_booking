import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/asset_path.dart';
import '../constants/styles.dart';
import '../controllers/field_controller.dart';

class FieldItem extends StatelessWidget {
  FieldItem({
    Key? key,
    required this.id,
    this.isAvaible = true,
  }) : super(key: key);

  final int id;
  final bool isAvaible;
  final FieldController _fieldController = Get.find();
  @override
  Widget build(BuildContext context) {
    _getFieldImage() {
      if (_fieldController.isFieldAvailable.value) {
        if (_fieldController.isFieldSelected.value) {
          return kGreenField;
        } else {
          return kWhiteField;
        }
      } else {
        return kGreyField;
      }
    }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _fieldController.loadFields();
          },
          child: Container(
            width: 154,
            height: 246,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_getFieldImage()),
              ),
            ),
          ),
        ),
        SizedBox(height: kDefaultPadding),
        Text(
          "Field $id",
          style: lightTextStyle.copyWith(fontSize: 12),
        ),
        SizedBox(height: kDefaultPadding * 2),
      ],
    );
  }
}
