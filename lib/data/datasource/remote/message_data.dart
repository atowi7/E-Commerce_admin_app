import 'package:ecommerce_admin_app/core/class/crud.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';

class MessageData {
  Crud crud;

  MessageData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.messageView, {
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String id, String userid) async {
    var response = await crud.postData(AppLink.messageDelete, {
      'id': id,
      'userid': userid,
    });
    return response.fold((l) => l, (r) => r);
  }
}
