import 'package:futsal_booking/constants/styles.dart';
import 'package:futsal_booking/models/field_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FieldCard extends StatelessWidget {
  const FieldCard({
    Key? key,
    required this.fieldModel,
  }) : super(key: key);

  final FieldModel fieldModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/timeslots');
      },
      child: Container(
        width: 141,
        height: 170,
        margin: EdgeInsets.only(left: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset(0, 9),
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 141,
              height: 126,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(fieldModel.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fieldModel.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      fieldModel.description,
                      style: lightTextStyle.copyWith(
                        fontWeight: light,
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
