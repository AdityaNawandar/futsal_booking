import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/firebase.dart';
import '../helpers/snackbar.dart';

class ImageController extends GetxController {
  static ImageController instance = Get.find();

  File? pickedImageFile;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    pickedImageFile = File(pickedImage!.path);
    update();
  }

  Future<String> getDownloadUrl() async {
    try {
      var imageUrl = "";
      //Create a reference to the location you want to upload to in firebase
      Reference storageReference = firebaseStorage.ref().child("fieldImages/");

      //Upload the file to firebase
      UploadTask uploadTask = storageReference.putFile(pickedImageFile!);

      // Wait till the file is uploaded then stores the download url
      uploadTask.then((res) async {
        imageUrl = await storageReference.getDownloadURL();
      });

      //returns the download url
      return imageUrl;
    } catch (e) {
      Snackbar.showSnackbar("Error", e.toString());
      return "";
    }
  }

  void Function() get pickImage => _pickImage;
}
