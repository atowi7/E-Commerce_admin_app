import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/notification_data.dart';
import 'package:ecommerce_admin_app/data/model/notificationmodel.dart';
import 'package:get/get.dart';

abstract class BaseNotificationController extends GetxController {
  getData();
  deleteData(String id);
}

class NotificationController extends BaseNotificationController {
  late String adminid;
  List<NotificationModel> dataList = [];

  AppServices appServices = Get.find();

  NotificationData notificationData = NotificationData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    adminid = appServices.sharedPreferences.getString('adminid')!;
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await notificationData.getData(adminid);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.noDatafailure;
      }
    } else {
      Get.snackbar('88'.tr, '89'.tr, duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }

    update();
  }

  @override
  deleteData(id) async {
    var response = await notificationData.deleteData(id, adminid);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.snackbar('30'.tr, '115'.tr, duration: const Duration(seconds: 2));
        update();
      } else {
        Get.snackbar('30'.tr, '116'.tr, duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('88'.tr, '89'.tr, duration: const Duration(seconds: 2));
    }
  }
}
