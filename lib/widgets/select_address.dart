import 'package:futsal_booking/constants/controllers.dart';
import 'package:futsal_booking/constants/styles.dart';
import 'package:futsal_booking/helpers/size_config.dart';
import 'package:futsal_booking/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

class SelectAddress extends StatelessWidget {
  SelectAddress({Key? key}) : super(key: key);
  Placemark? address = mapController.placemarks[0];

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        constraints: BoxConstraints(
          minHeight: SizeConfig.screenHeight * 0.15,
          minWidth: double.infinity,
          maxHeight: SizeConfig.screenHeight * 0.5,
        ),
        child: Card(
          elevation: 9,
          color: kBlackColor,
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: (address != null)
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        address!.street! +
                            " " +
                            address!.locality! +
                            " " +
                            address!.subLocality!,
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        "${address!.subAdministrativeArea}",
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        "${address!.administrativeArea}",
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                      Text(
                        "${address!.country}",
                        style: whiteTextStyle.copyWith(fontSize: 16),
                      ),
                      CustomButton(
                          text: "Select",
                          onTap: () {
                            fieldOwnerController
                                .selectFieldLocation(formatAddress());
                          }),
                    ],
                  )
                : null,
          ),
        ),
      ),
    );
  }

  formatAddress() {
    var completeAddress = "";

    if (address!.street != "") {
      completeAddress += "${address!.street}";
    }
    if (address!.subLocality != "") {
      completeAddress += "\n${address!.subLocality}";
    }
    if (address!.subAdministrativeArea != "") {
      completeAddress += "\n${address!.subAdministrativeArea}";
    }
    if (address!.administrativeArea != "") {
      completeAddress += "\n${address!.administrativeArea}";
    }
    if (address!.postalCode != "") {
      completeAddress += "\n${address!.postalCode}";
    }

    return completeAddress;
  }
}
