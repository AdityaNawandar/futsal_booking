import 'package:futsal_booking/controllers/field_owner_controller.dart';
import 'package:futsal_booking/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
//import 'package:image_picker/image_picker.dart';
import '../../constants/controllers.dart';
import '../../constants/dimens_n_strings.dart';
import '../../constants/styles.dart';
import '../../helpers/size_config.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/custom_textfield_multiline.dart';

class RegisterFieldScreen extends StatelessWidget {
  RegisterFieldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => fieldOwnerController.assignAddress());
    fieldOwnerController.checkStoragePermission();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBlackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Container(
              height: SizeConfig.screenHeight * 1.2,
              child: Column(
                //mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: kDefaultPadding),
                  CustomTextField(
                    textEditingController: fieldOwnerController.nameCtrlr,
                    hintText: "Field Name",
                  ),
                  SizedBox(height: kDefaultPadding),
                  MultiLineTextField(
                    textEditingController:
                        fieldOwnerController.descriptionCtrlr,
                    hintText: "Description",
                    icon: null,
                  ),
                  SizedBox(height: kDefaultPadding),
                  Obx(
                    () => MultiLineTextField(
                      textEditingController:
                          fieldOwnerController.addressCtrlr.value,
                      hintText: "",
                      icon: null,
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
                    child: NumberInputWithIncrementDecrement(
                      style: TextStyle(
                        color: kBlackColor,
                        fontSize: 22,
                      ),
                      //onChanged: fieldOwnerController.charges.value,
                      widgetContainerDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kBorderRadiusMin),
                        color: kTextFieldFillColor,
                      ),
                      numberFieldDecoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15, right: 15),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(width: 3, color: Colors.red),
                        ),
                        disabledBorder: InputBorder.none,
                      ),
                      controller: fieldOwnerController.chargesCtrlr,
                      min: 0,
                      max: 1000,
                      decIconColor: kBlackColor,
                      incIconColor: kBlackColor,
                    ),
                  ),
                  SizedBox(height: kDefaultPadding),
                  CustomImagePicker(),
                  SizedBox(height: kDefaultPadding),
                  CustomButton(
                    text: "Pick an Image",
                    onTap: imageController.pickImage,
                  ),
                  SizedBox(height: kDefaultPadding),
                  Spacer(),
                  CustomButton(
                    text: "Register Field",
                    onTap: fieldOwnerController.addField,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
