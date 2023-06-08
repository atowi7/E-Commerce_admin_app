import 'dart:io';

import 'package:ecommerce_admin_app/controller/categorie/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/function/uploadfile.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/categorie_date.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseCategorieAddController extends GetxController {
  add();
  chooseImage();
}

class CategorieAddController extends BaseCategorieAddController {
  AppServices appServices = Get.find();

  CategorieDate categorieDate = CategorieDate(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;

  File? imageFile;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    super.onInit();
  }

  @override
  add() async {
    if (formState.currentState!.validate()) {
      if (imageFile == null) {
        return Get.snackbar('Warrning', 'Please choose an image');
      }

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        'name': name.text,
        'namear': nameAr.text,
      };
      var response = await categorieDate.addData(data, imageFile!);

      statusRequest = handleData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.categorieView);
          CategorieViewController controller = Get.find();
          controller.view();
        } else {
          statusRequest = StatusRequest.noDatafailure;
        }
      } else {
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
