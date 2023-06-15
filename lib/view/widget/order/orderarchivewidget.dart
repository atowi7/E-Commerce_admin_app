import 'package:ecommerce_admin_app/controller/orders/ordersarchive_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:rating_dialog/rating_dialog.dart';

class OrderArchiveWedget extends GetView<OrdersArchiveController> {
  final OrderModel orderModel;
  const OrderArchiveWedget({super.key, required this.orderModel});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                '${'46'.tr} : ${orderModel.ordersId}',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const Spacer(),
              Text(
                Jiffy.parse(orderModel.ordersCreatedat!).fromNow(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const Divider(color: AppColor.blue),
          Text('${'47'.tr} : ${orderModel.ordersPrice}'),
          Text('${'48'.tr} : ${orderModel.ordersDeliveryprice}\$'),
          Text(
              '${'49'.tr} : ${controller.getPaymentMethod(orderModel.ordersPaymentmethod!)}'),
          Text(
              '${'50'.tr} : ${controller.getDeliveryType(orderModel.ordersType!)}'),
          Text(
              '${'51'.tr} : ${controller.getStatus(orderModel.ordersStatus!)}'),
          const Divider(color: AppColor.blue),
          Text('${'52'.tr} : ${orderModel.ordersTotalprice}\$'),
          const Divider(color: AppColor.blue),
          MaterialButton(
              onPressed: () {
                Get.toNamed(AppRoute.ordersDetails, arguments: {
                  'orderModel': orderModel,
                });
              },
              color: AppColor.blue,
              child: Text('53'.tr)),
        ],
      ),
    );
  }
}
