import 'package:ecommerce_admin_app/core/class/crud.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.ordersViewPending, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String orderId, String userId) async {
    var response = await crud.postData(AppLink.ordersApproval, {
      'ordersid': orderId,
      'userid': userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
