import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/product_data.dart';
import 'package:ecommerce_admin_app/data/model/productmodel.dart';
import 'package:get/get.dart';

abstract class BaseProductViewController extends GetxController {
  view();
  back();
  goToEdit(ProductModel productModel);
  delete(String id, String imagename);
}

class ProductViewController extends BaseProductViewController {
  List<ProductModel> productList = [];
  AppServices appServices = Get.find();

  ProductDate productDate = ProductDate(Get.find());

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
    var response = await productDate.getData();

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        productList.clear();
        productList.addAll(data.map((e) => ProductModel.fromJson(e)));
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
  goToEdit(productModel) {
    Get.toNamed(AppRoute.productEdit,
        arguments: {'productModel': productModel});
  }

  @override
  delete(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      'id': id,
      'imagename': imagename,
    };

    var response = await productDate.deleteData(data);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        productList.removeWhere((element) => element.id == id);
        update();
        Get.snackbar('NOTFY', '127'.tr, duration: const Duration(seconds: 2));
      } else {
        Get.snackbar('NOTFY', '128'.tr, duration: const Duration(seconds: 2));
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
