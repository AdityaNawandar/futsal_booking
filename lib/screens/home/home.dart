import 'package:futsal_booking/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/asset_path.dart';
import '../../constants/controllers.dart';
import '../../constants/styles.dart';
import '../../controllers/field_controller.dart';
import '../../helpers/size_config.dart';
import '../../models/field_model.dart';
import '../field/widgets/field_card.dart';

class HomeScreen extends StatelessWidget {
  final FieldController _fieldController = Get.find();
  User user;
  HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: const Center(
          child: CustomText(
            text: "Futsal",
            size: 22,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: kBlackColor,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Container(
                width: SizeConfig.screenHeight * 0.05,
                height: SizeConfig.screenHeight * 0.05,
                margin: EdgeInsets.only(right: kDefaultPadding / 2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(kProfileImage),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: kBlackColor,
              ),
              accountName:
                  Text('${authController.userModel.value!.name ?? ''}'),
              accountEmail:
                  Text('${authController.userModel.value!.email ?? ''}'),
            ),
            Divider(
              color: kOrangeColor,
              thickness: 3,
            ),
            ListTile(
              onTap: () {
                authController.signOut();
              },
              leading: Icon(
                Icons.exit_to_app,
                color: kWhiteColor,
              ),
              title: Text("Log out"),
            )
          ],
        ),
      ),
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Row(
                children: [
                  // Container(
                  //   width: SizeConfig.screenHeight * 0.05,
                  //   height: SizeConfig.screenHeight * 0.05,
                  //   margin: EdgeInsets.only(right: kDefaultPadding / 2),
                  //   decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage(kProfileImage),
                  //     ),
                  //   ),
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, ${authController.userModel.value!.name}",
                        style: whiteTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(height: kDefaultPadding / 2),
                      Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: kWhiteColor,
                          ),
                          // Container(
                          //   width: 15,
                          //   height: 15,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image: AssetImage(
                          //         kLocationIcon,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          SizedBox(width: kDefaultPadding / 2),
                          Text(
                            "User Location",
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: regular,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                ],
              ),

              searchSection(),
              Obx(
                () => contentSection(_fieldController.fields),
              ), //Aditya ,
              //const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  // Widget topBar() {
  //   return Container(
  //     margin: EdgeInsets.only(
  //       left: kDefaultPadding,
  //       right: kDefaultPadding,
  //       top: kDefaultPadding,
  //     ),
  //     width: double.infinity,
  //     child: Row(
  //       children: [
  //         Container(
  //           width: 34,
  //           height: 34,
  //           margin: EdgeInsets.only(right: 8),
  //           decoration: BoxDecoration(
  //             image: DecorationImage(
  //               image: AssetImage("assets/image_profile.png"),
  //             ),
  //           ),
  //         ),
  //         Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               "Hello, Aditya",
  //               style: blackTextStyle.copyWith(
  //                 fontSize: 12,
  //                 fontWeight: semiBold,
  //               ),
  //             ),
  //             SizedBox(height: 5),
  //             Row(
  //               children: [
  //                 Container(
  //                   width: 15,
  //                   height: 15,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                       image: AssetImage("assets/icon_location.png"),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(width: 4),
  //                 Text(
  //                   "West Street, Samarinda",
  //                   style: lightTextStyle.copyWith(
  //                     fontSize: 12,
  //                     fontWeight: regular,
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //         Spacer(),
  //         ContainerIcon(imageUrl: "assets/icon_notification.png"),
  //       ],
  //     ),
  //   );
  // }

  Widget searchSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            kHomePageHeading,
            style: whiteTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: kDefaultPadding),
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: kWhiteColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 50,
                  color: Colors.black.withOpacity(0.05),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                //contentPadding: EdgeInsets.zero,
                hintText: kHomePageSearchHintText,
                hintStyle: blackTextStyle.copyWith(fontSize: 16),
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: kBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget contentSection(List<FieldModel> fieldData) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Note: Section - Previous Bookings
          Container(
            margin: EdgeInsets.only(left: kDefaultPadding),
            child: Text(
              kHomePageFirstRowHeading,
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: kDefaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 24),
            child: Row(
              children: fieldData.map<Widget>((FieldModel fieldModel) {
                return FieldCard(fieldModel: fieldModel);
              }).toList(),
            ),
          ),
          // Note: Section - Nearest Fields
          Container(
            margin: EdgeInsets.only(left: kDefaultPadding),
            child: Text(
              "Nearest Fields",
              style: whiteTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(bottom: 24),
            child: Row(
              children: fieldData.map<Widget>((FieldModel fieldModel) {
                return FieldCard(fieldModel: fieldModel);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
