import 'package:ecommerce_admin_app/controller/orders/ordersarchive_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/view/widget/order/orderarchivewidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchiveScreen extends StatelessWidget {
  const OrdersArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
      body: GetBuilder<OrdersArchiveController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, i) =>
                OrderArchiveWedget(orderModel: controller.dataList[i]),
          ),
        );
      }),
    );
  }
}
