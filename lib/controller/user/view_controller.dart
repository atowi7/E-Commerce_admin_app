import 'package:ecommerce_admin_app/core/class/status_request.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/core/function/handle_data.dart';
import 'package:ecommerce_admin_app/core/service/services.dart';
import 'package:ecommerce_admin_app/data/datasource/remote/user_data.dart';
import 'package:ecommerce_admin_app/data/model/usermodel.dart';
import 'package:get/get.dart';

abstract class BaseUserViewController extends GetxController {
  view();
  back();
  goToEdit(UserModel userModel);
  delete(String id, String imagename);
}

class UserViewController extends BaseUserViewController {
  List<UserModel> userList = [];
  AppServices appServices = Get.find();

  UserData userDate = UserData(Get.find());

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
    var response = await userDate.getData();

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List data = response['data'];
        userList.clear();
        userList.addAll(data.map((e) => UserModel.fromJson(e)));
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
  goToEdit(userModel) {
    Get.toNamed(AppRoute.userEdit, arguments: {'userModel': userModel});
  }

  @override
  delete(String id, String imagename) async {
    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      'id': id,
      'imagename': imagename,
    };

    var response = await userDate.deleteData(data);

    statusRequest = handleData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        userList.removeWhere((element) => element.id == id);
        update();
        Get.snackbar('30'.tr, '118'.tr,duration: const Duration(seconds: 2));
      } else {
        Get.snackbar('30'.tr, '119'.tr,duration: const Duration(seconds: 2));
      }
    } else {
      Get.snackbar('88'.tr, '89'.tr,duration: const Duration(seconds: 2));
      statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
