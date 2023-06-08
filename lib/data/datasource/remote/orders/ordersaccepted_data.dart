import 'package:ecommerce_admin_app/core/class/crud.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.ordersViewAccepted, {});
    return response.fold((l) => l, (r) => r);
  }

  prepare(String orderId, String userId, String orderType) async {
    var response = await crud.postData(AppLink.ordersPrepare, {
      'ordersid': orderId,
      'userid': userId,
      'ordertype': orderType,
    });
    return response.fold((l) => l, (r) => r);
  }
}
