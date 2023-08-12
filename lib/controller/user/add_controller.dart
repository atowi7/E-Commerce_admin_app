import 'dart:io';

import 'package:ecommerce_admin_app/controller/user/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/function/uploadfile.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/user_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseuserAddController extends GetxController {
  add();
  chooseImage();
}

class UserAddController extends BaseuserAddController {
  AppServices appServices = Get.find();

  UserData userData = UserData(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  File? imageFile;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  add() async {
    if (formState.currentState!.validate()) {
      if (imageFile == null) {
        return Get.snackbar('30'.tr, '85'.tr,
            duration: const Duration(seconds: 2));
      }

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        'name': userName.text,
        'email': email.text,
        'pass': password.text,
        'phone': phone.text,
      };
      var response = await userData.addData(data, imageFile!);

      statusRequest = handleData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
          Get.offNamed(AppRoute.userView);
          UserViewController controller = Get.find();
          controller.view();
          Get.snackbar('30'.tr, '123'.tr, duration: const Duration(seconds: 2));
        } else {
          Get.snackbar('30'.tr, '124'.tr, duration: const Duration(seconds: 2));
          statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.snackbar('88'.tr, '89'.tr, duration: const Duration(seconds: 2));
        statusRequest = StatusRequest.serverFailure;
      }
      update();
    }
  }

  @override
  chooseImage() async {
    imageFile = await fileUploadGallery(true);
    update();
  }
}
