import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/orders/orderspending_data.dart';
import 'package:ecommerce_admin_app/data/model/ordermodel.dart';
import 'package:get/get.dart';

abstract class BaseOrdersPendingController extends GetxController {
  viewOrders();
  String getDeliveryType(String val);
  String getPaymentMethod(String val);
  String getStatus(String val);
  approveOrders(String orderId, String userId);
  refreshPage();
}

class OrdersPendingController extends BaseOrdersPendingController {
  List<OrderModel> dataList = [];
  AppServices appServices = Get.find();

  OrdersPendingData ordersdata = OrdersPendingData(Get.find());

  late StatusRequest statusRequest;
  @override
  void onInit() {
    viewOrders();
    super.onInit();
  }

  @override
  viewOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata.getData();

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  approveOrders(String orderId, String userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersdata.approveOrders(orderId, userId);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        Get.snackbar('Warring', 'The ordre is approved');
        refreshPage();
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  refreshPage() {
    viewOrders();
  }

  @override
  String getDeliveryType(String val) {
    if (val == '0') {
      return 'delivery';
    } else {
      return 'Myself';
    }
  }

  @override
  String getPaymentMethod(String val) {
    if (val == '0') {
      return 'cash';
    } else {
      return 'card';
    }
  }

  @override
  String getStatus(String val) {
    if (val == '0') {
      return 'waitting for approval';
    } else if (val == '1') {
      return 'preparing';
    } else if (val == '2') {
      return 'On the way';
    } else if (val == '3') {
      return 'Ready to pickup by delivery service';
    } else {
      return 'Archive';
    }
  }
}
