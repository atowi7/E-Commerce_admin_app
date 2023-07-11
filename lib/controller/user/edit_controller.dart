import 'dart:io';

import 'package:ecommerce_admin_app/controller/user/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/function/uploadfile.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/user_data.dart';
import 'package:ecommerce_admin_app/data/model/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseuserEditController extends GetxController {
  edit();
  chooseImage();
}

class UserEditController extends BaseuserEditController {
  AppServices appServices = Get.find();

  UserData userData = UserData(Get.find());

  UserModel? userModel;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;

  File? imageFile;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();

    userModel = Get.arguments['userModel'];

    name.text = userModel!.name!;

    super.onInit();
  }

  @override
  edit() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        'id': userModel!.id.toString(),
        'name': name.text,
        'oldimagename': userModel!.image!,
      };

      var response = await userData.editData(data, imageFile);

      statusRequest = handleData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.userView);
          UserViewController controller = Get.find();
          controller.view();
          Get.snackbar('30'.tr, '125'.tr,duration: const Duration(seconds: 2));
        } else {
          Get.snackbar('30'.tr, '126'.tr,duration: const Duration(seconds: 2));
          statusRequest = StatusRequest.noDatafailure;
        }
      } else {
        Get.snackbar('88'.tr, '89'.tr,duration: const Duration(seconds: 2));
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
