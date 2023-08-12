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
                style: Theme.of(context).textTheme.displayLarge,
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
          Text(
            '${'48'.tr} : ${orderModel.ordersDeliveryprice}\$',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            '${'49'.tr} : ${controller.getPaymentMethod(orderModel.ordersPaymentmethod!)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            '${'50'.tr} : ${controller.getDeliveryType(orderModel.ordersType!)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            '${'51'.tr} : ${controller.getStatus(orderModel.ordersStatus!)}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(color: AppColor.primaryColor, thickness: 2),
          Text('${'52'.tr} : ${orderModel.ordersTotalprice}\$'),
          const Divider(color: AppColor.primaryColor),
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
                child: Text(
                  '53'.tr,
                  style: Theme.of(context).textTheme.labelLarge,
                )),
          ),
        ],
      ),
    );
  }
}
