import 'dart:io';

import 'package:ecommerce_admin_app/core/class/crud.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';

class CategorieDate {
  Crud crud;

  CategorieDate(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.categorieView, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response =
        await crud.postDataWithImage(AppLink.categorieAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  editData(Map data, File? file) async {
    var response;

    if (file == null) {
      response = await crud.postData(AppLink.categorieEdit, data);
    } else {
      response =
          await crud.postDataWithImage(AppLink.categorieEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  deleteData(Map data) async {
    var response = await crud.postData(AppLink.categorieDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
