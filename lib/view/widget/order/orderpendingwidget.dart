import 'package:ecommerce_admin_app/controller/orders/orderspending_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderPendingWedget extends GetView<OrdersPendingController> {
  final OrderModel orderModel;
  const OrderPendingWedget({super.key, required this.orderModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.forthColor,
        borderRadius: BorderRadius.circular(25),
      ),
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
                Jiffy.parse(orderModel.orderscreatedAt!).fromNow(),
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ],
          ),
          const Divider(color: AppColor.primaryColor, thickness: 2),
          Text(
            '${'47'.tr} : ${orderModel.ordersPrice}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text('${'48'.tr} : ${orderModel.ordersDeliveryprice}\$'),
          Text(
            '${'49'.tr} : ${controller.getPaymentMethod(orderModel.ordersPaymentmethod!)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            '${'50'.tr} : ${controller.getDeliveryType(orderModel.ordersType!)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(color: AppColor.primaryColor, thickness: 2),
          Text(
            '${'52'.tr} : ${orderModel.ordersTotalprice}\$',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(color: AppColor.primaryColor, thickness: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: () {
                    controller.approveOrders(
                        orderModel.ordersId!, orderModel.ordersUserid!);
                  },
                  color: AppColor.primaryColor,
                  child: Text('84'.tr)),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                child: MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersDetails, arguments: {
                        'orderModel': orderModel,
                      });
                    },
                    splashColor: AppColor.secondaryColor,
                    child: Text('53'.tr)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
