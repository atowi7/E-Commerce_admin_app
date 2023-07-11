import 'dart:io';

import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  try {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 90);
    if (file != null) {
      return File(file.path);
    } else {
      return null;
    }
  } catch (e) {
    Get.snackbar('88'.tr, e.toString(), duration: const Duration(seconds: 2));
  }
}

fileUploadGallery([isSVG = false]) async {
  try {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions:
          isSVG ? ['svg', 'SVG'] : ['png', 'PNG', 'jpeg', 'JPEG', 'gif', 'GIF'],
    );

    if (result != null) {
      print(' result : $result');
      return File(result.files.single.path!);
    } else {
      print(' result : $result');
      return null;
    }
  } catch (e) {
    Get.snackbar('88'.tr, e.toString(), duration: const Duration(seconds: 2));
  }
}

showBottomOptions(
    BuildContext context, imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.secondaryColor,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Choose image',
                style: Theme.of(context).textTheme.displayLarge),
            ListTile(
              onTap: () {
                imageUploadCamera();
              },
              leading: const Icon(
                Icons.camera,
                size: 30,
                color: AppColor.primaryColor,
              ),
              title: Text('Take photo from camera',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColor.forthColor)),
            ),
            const Divider(
              color: AppColor.thirdColor,
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
              },
              leading: const Icon(
                Icons.image,
                size: 30,
                color: AppColor.primaryColor,
              ),
              title: Text(' from gallery',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColor.forthColor)),
            ),
          ]),
    ),
  );
}
