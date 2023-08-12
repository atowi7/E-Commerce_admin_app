import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class BaseHomeScreenController extends GetxController {
  getData();
}

class HomeScreenController extends BaseHomeScreenController {
  String? id;
  String? name;

  late StatusRequest statusRequest;

  HomeData homeData = HomeData(Get.find());
  AppServices appServices = Get.find();

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await homeData.getData();

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
