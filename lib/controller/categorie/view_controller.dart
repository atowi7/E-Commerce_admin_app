import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/categorie_data.dart';
import 'package:ecommerce_admin_app/data/model/categoriemodel.dart';
import 'package:get/get.dart';

abstract class BaseCategorieViewController extends GetxController {
  view();
  back();
  goToEdit(CategorieModel categorieModel);
  delete(String id, String imagename);
}

class CategorieViewController extends BaseCategorieViewController {
  List<CategorieModel> categorieList = [];
  AppServices appServices = Get.find();

  CategorieData categorieData = CategorieData(Get.find());

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
    var response = await categorieData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        categorieList.clear();
        categorieList.addAll(data.map((e) => CategorieModel.fromJson(e)));
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

    var response = await categorieData.deleteData(data);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        categorieList.removeWhere((element) => element.id == id);
        update();
        Get.snackbar('30'.tr, '92'.tr,duration: const Duration(seconds: 2));
      } else {
        Get.snackbar('30'.tr, '93'.tr,duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('88'.tr, '89'.tr,duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
