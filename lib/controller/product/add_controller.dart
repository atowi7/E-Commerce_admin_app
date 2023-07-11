import 'dart:io';

import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app/controller/product/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/function/uploadfile.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/categorie_data.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/product_data.dart';
import 'package:ecommerce_admin_app/data/model/categoriemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseProductAddController extends GetxController {
  add();
  getCategories();
  chooseImageOptions(BuildContext context);
  chooseImageFromCamera();
  chooseImageFromGallery();
}

class ProductAddController extends BaseProductAddController {
  AppServices appServices = Get.find();

  ProductDate productDate = ProductDate(Get.find());

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;

  late TextEditingController desc;
  late TextEditingController descAr;

  File? imageFile;

  late TextEditingController price;
  late TextEditingController discount;

  late TextEditingController count;

  late TextEditingController catId;
  late TextEditingController catName;

  List<SelectedListItem> dropDownList = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();

    catId = TextEditingController();
    catName = TextEditingController();

    getCategories();

    super.onInit();
  }

  @override
  add() async {
    if (formState.currentState!.validate()) {
      if (catId.text.isEmpty) {
        return Get.snackbar('30'.tr, '132'.tr,
            duration: const Duration(seconds: 2));
      }

      if (imageFile == null) {
        return Get.snackbar('30'.tr, '85'.tr,
            duration: const Duration(seconds: 2));
      }

      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        'name': name.text,
        'namear': nameAr.text,
        'desc': desc.text,
        'descar': descAr.text,
        'price': price.text,
        'discount': discount.text,
        'count': count.text,
        'date': DateTime.now().toString(),
        'catid': catId.text,
      };
      var response = await productDate.addData(data, imageFile!);

      statusRequest = handleData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.productView);
          ProductViewController controller = Get.find();
          controller.view();
          Get.snackbar('30'.tr, '111'.tr, duration: const Duration(seconds: 2));
        } else {
          Get.snackbar('30'.tr, '112'.tr, duration: const Duration(seconds: 2));
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
  getCategories() async {
    List<CategorieModel> dataList = [];

    CategorieData categorieData = CategorieData(Get.find());

    statusRequest = StatusRequest.loading;
    update();
    var response = await categorieData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => CategorieModel.fromJson(e)));

        for (var i = 0; i < dataList.length; i++) {
          dropDownList.add(
              SelectedListItem(value: dataList[i].id, name: dataList[i].name!));
        }
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  chooseImageOptions(BuildContext context) {
    showBottomOptions(context, chooseImageFromCamera, chooseImageFromGallery);
  }

  @override
  chooseImageFromCamera() async {
    imageFile = await imageUploadCamera();
    update();
  }

  @override
  chooseImageFromGallery() async {
    imageFile = await fileUploadGallery(false);
    update();
  }
}
