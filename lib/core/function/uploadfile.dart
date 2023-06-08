import 'dart:io';

import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (file != null) {
    return File(file.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSVG = false]) async {
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
}

showBottomOptions(imageUploadCamera(), fileUploadGallery()) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(10),
      color: AppColor.blue,
      child: Column(children: [
        const Text('Choose image',
            style: TextStyle(
                color: AppColor.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        ListTile(
          onTap: () {
            imageUploadCamera();
          },
          leading: const Icon(Icons.camera),
          title: const Text('Take photo from camera'),
        ),
        const Divider(),
        ListTile(
          onTap: () {
            fileUploadGallery();
          },
          leading: const Icon(Icons.image),
          title: const Text(' from gallery'),
        ),
      ]),
    ),
  );
}
