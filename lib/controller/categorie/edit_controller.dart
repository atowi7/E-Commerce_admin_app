import 'dart:io';

import 'package:ecommerce_admin_app/controller/categorie/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/function/uploadfile.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/categorie_data.dart';
import 'package:ecommerce_admin_app/data/model/categoriemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseCategorieEditController extends GetxController {
  edit();
  chooseImage();
}

class CategorieEditController extends BaseCategorieEditController {
  AppServices appServices = Get.find();

  CategorieData categorieData = CategorieData(Get.find());

  CategorieModel? categorieModel;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;

  File? imageFile;

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();

    categorieModel = Get.arguments['categorieModel'];

    name.text = categorieModel!.name!;
    nameAr.text = categorieModel!.nameAr!;

    super.onInit();
  }

  @override
  edit() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        'id': categorieModel!.id.toString(),
        'name': name.text,
        'namear': nameAr.text,
        'oldimagename': categorieModel!.image!,
      };

      var response = await categorieData.editData(data, imageFile);

      statusRequest = handleData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.categorieView);
          CategorieViewController controller = Get.find();
          controller.view();
          Get.snackbar('30'.tr, '90'.tr,duration: const Duration(seconds: 2));
        } else {
          Get.snackbar('30'.tr, '91'.tr,duration: const Duration(seconds: 2));
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
