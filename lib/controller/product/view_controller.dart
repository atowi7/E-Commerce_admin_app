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
  List<ProductModel> dataList = [];
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => ProductModel.fromJson(e)));
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

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        dataList.removeWhere((element) => element.id == id);
        update();
        Get.snackbar('NOTFY', 'delete from Product sucess');
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
