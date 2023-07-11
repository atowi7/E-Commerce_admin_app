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
import 'package:ecommerce_admin_app/data/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseProductEditController extends GetxController {
  edit();
  getCategories();
  changeActiveStatus(val);
  chooseImageOptions(BuildContext context);
  chooseImageFromCamera();
  chooseImageFromGallery();
}

class ProductEditController extends BaseProductEditController {
  AppServices appServices = Get.find();

  ProductDate productDate = ProductDate(Get.find());

  ProductModel? productModel;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController nameAr;

  late TextEditingController desc;
  late TextEditingController descAr;

  File? imageFile;

  late TextEditingController price;
  late TextEditingController discount;

  String? active;

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
    price = TextEditingController();
    discount = TextEditingController();
    count = TextEditingController();
    catId = TextEditingController();
    catName = TextEditingController();

    productModel = Get.arguments['productModel'];

    name.text = productModel!.name!;
    nameAr.text = productModel!.nameAr!;
    desc.text = productModel!.description!;
    descAr.text = productModel!.descriptionAr!;
    price.text = productModel!.price!;
    discount.text = productModel!.discount!;
    active = productModel!.active;
    count.text = productModel!.count!;
    catId.text = productModel!.cId!;
    catName.text = productModel!.cName!;

    getCategories();

    super.onInit();
  }

  @override
  edit() async {
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
        'id': productModel!.id.toString(),
        'name': name.text,
        'namear': nameAr.text,
        'oldimagename': productModel!.image!,
        'desc': desc.text,
        'descar': descAr.text,
        'price': price.text,
        'discount': discount.text,
        'active': active,
        'count': count.text,
        'date': DateTime.now().toString(),
        'catid': catId.text,
      };

      var response = await productDate.editData(data, imageFile);

      statusRequest = handleData(response);

      if (StatusRequest.sucess == statusRequest) {
        if (response['status'] == 'sucess') {
          Get.offNamed(AppRoute.productView);
          ProductViewController controller = Get.find();
          Get.snackbar('88'.tr, '113'.tr, duration: const Duration(seconds: 2));
          controller.view();
        } else {
          Get.snackbar('88'.tr, '114'.tr, duration: const Duration(seconds: 2));
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
  changeActiveStatus(val) {
    active = val;
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
