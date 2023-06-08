import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/categorie_date.dart';
import 'package:ecommerce_admin_app/data/model/categoriemodel.dart';
import 'package:get/get.dart';

abstract class BaseCategorieViewController extends GetxController {
  view();
  back();
  goToEdit(CategorieModel categorieModel);
  delete(String id, String imagename);
}

class CategorieViewController extends BaseCategorieViewController {
  List<CategorieModel> dataList = [];
  AppServices appServices = Get.find();

  CategorieDate categorieDate = CategorieDate(Get.find());

  late StatusRequest statusRequest;
  @override
  void onInit() {
    view();
    super.onInit();
  }

  @override
  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await categorieDate.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => CategorieModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  back() {
    Get.offAllNamed(AppRoute.homePage);
    return Future.value(true);
  }

  @override
  goToEdit(categorieModel) {
    Get.toNamed(AppRoute.categorieEdit,
        arguments: {'categorieModel': categorieModel});
  }

  @override
  delete(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      'id': id,
      'imagename': imagename,
    };

    var response = await categorieDate.deleteData(data);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        dataList.removeWhere((element) => element.id == id);
        update();
        Get.snackbar('NOTFY', 'delete from Categorie sucess');
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
