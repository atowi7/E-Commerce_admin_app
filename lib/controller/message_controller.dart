import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/message_data.dart';
import 'package:ecommerce_admin_app/data/model/messagemodel.dart';
import 'package:get/get.dart';

abstract class BaseMessageController extends GetxController {
  getData();
  deleteData(String id);
}

class MessageController extends BaseMessageController {
  late String userid;
  List<MessageModel> dataList = [];

  AppServices appServices = Get.find();

  MessageData messageData = MessageData(Get.find());

  late StatusRequest statusRequest;

  @override
  void onInit() {
    userid = appServices.sharedPreferences.getString('adminid')!;
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await messageData.getData(userid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
        List data = response['data'];
        dataList.clear();
        dataList.addAll(data.map((e) => MessageModel.fromJson(e)));
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
    var response = await messageData.deleteData(id, userid);

    statusRequest = handleData(response);

    if (StatusRequest.sucess == statusRequest) {
      if (response['status'] == 'sucess') {
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
