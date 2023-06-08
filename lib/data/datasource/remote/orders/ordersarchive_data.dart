import 'package:ecommerce_admin_app/core/class/crud.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.ordersArchive, {});
    return response.fold((l) => l, (r) => r);
  }
}
