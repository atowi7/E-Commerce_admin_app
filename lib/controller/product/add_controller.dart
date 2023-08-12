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

  late TextEditingController color;
  late TextEditingController colorAr;

  File? imageFile;

  late TextEditingController price;
  late TextEditingController discount;

  late TextEditingController paymentId;
  late TextEditingController paymentName;

  late TextEditingController count;

  late TextEditingController catId;
  late TextEditingController catName;

  List<SelectedListItem> catdropDownList = [];
  List<SelectedListItem> paymentdropDownList = [];

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    name = TextEditingController();
    nameAr = TextEditingController();
    desc = TextEditingController();
    descAr = TextEditingController();
    color = TextEditingController();
    colorAr = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    paymentId = TextEditingController();
    paymentName = TextEditingController();

    catId = TextEditingController();
    catName = TextEditingController();

    paymentdropDownList = [
      SelectedListItem(value: '0', name: 'Cash'),
      SelectedListItem(value: '1', name: 'Card'),
      SelectedListItem(value: '2', name: 'Both'),
    ];

    getCategories();

    super.onInit();
  }

  @override
  add() async {
    if (formState.currentState!.validate()) {
      if (catId.text.isEmpty) {
        return Get.snackbar('30'.tr, '129'.tr,
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
        'price': double.parse(price.text),
        'discount': int.parse(discount.text),
        'payment': int.parse(paymentId.text),
        'count': int.parse(count.text),
        'date': DateTime.now().toIso8601String(),
        'catid': int.parse(catId.text),
      };
      var response = await productDate.addData(data, imageFile!);

      statusRequest = handleData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == 'success') {
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

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => CategorieModel.fromJson(e)));

        for (var i = 0; i < dataList.length; i++) {
          catdropDownList.add(
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
