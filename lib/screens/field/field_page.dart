import 'package:futsal_booking/constants/styles.dart';

import 'package:flutter/material.dart';
//import 'package:get/get.dart';

import '../../models/field_model.dart';
//import '../../models/transaction_model.dart';
import '../../widgets/container_icon.dart';
import '../../widgets/field_item.dart';
import '../../widgets/my_button.dart';

class FieldPage extends StatelessWidget {
  const FieldPage(this.lapangan, {Key? key}) : super(key: key);

  final FieldModel lapangan;

  @override
  Widget build(BuildContext context) {
    Widget topBarSection() {
      return Container(
        margin: EdgeInsets.all(kDefaultPadding),
        width: double.infinity,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ContainerIcon(imageUrl: "assets/icon_arrow.png"),
            ),
            Spacer(),
            Text(
              "Pilih Lapangan",
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: semiBold,
              ),
            ),
            Spacer(),
          ],
        ),
      );
    }

    Widget lapanganStatus() {
      return Container(
        margin: EdgeInsets.all(kDefaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tersedia
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(right: 4, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhiteColor,
                border: Border.all(width: 1, color: kLightGreyColor),
              ),
            ),
            Text(
              "Tersedia",
              style: blackTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
            // Telah dibooking
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(right: 4, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kLightGreyColor,
                border: Border.all(width: 1, color: kLightGreyColor),
              ),
            ),
            Text(
              "Telah dibooking",
              style: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
            // Dipilih
            Container(
              width: 12,
              height: 12,
              margin: EdgeInsets.only(right: 4, left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kGreenDarkColor,
                border: Border.all(width: 1, color: kGreenDarkColor),
              ),
            ),
            Text(
              "Dipilih",
              style: greenTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget pilihanLapangan() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldItem(id: 1, isAvaible: false),
                FieldItem(id: 2),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FieldItem(id: 3),
                FieldItem(id: 4, isAvaible: false),
              ],
            ),
          ],
        ),
      );
    }

    Widget bottomSection() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Lapangan dipilih",
                  style: lightTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Lapangan ",
                  style: blackTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
            MyButton(
              onTap: () {
                //Get.to(Test());
                // Navigator.push(
                //   context,
                // MaterialPageRoute(
                //   builder: (context) => CheckoutPage(
                //     transaksi: TransactionModel(
                //       field: lapangan,
                //       number: 1,//Aditya
                //     ),
                //   ),
                // ),
                //);
              },
              width: 154,
              height: 45,
              margin: EdgeInsets.zero,
              text: "Lanjutkan",
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            topBarSection(),
            lapanganStatus(),
            pilihanLapangan(),
            bottomSection(),
          ],
        ),
      ),
    );
  }
}
