import 'dart:io';

import 'package:ecommerce_admin_app/core/class/crud.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';

class ProductDate {
  Crud crud;

  ProductDate(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.productView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response = await crud.postDataWithImage(AppLink.productAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, File? file) async {
    var response;

    if (file == null) {
      response = await crud.postData(AppLink.productEdit, data);
    } else {
      response = await crud.postDataWithImage(AppLink.productEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.productDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
