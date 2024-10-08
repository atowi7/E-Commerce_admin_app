import 'package:ecommerce_admin_app/controller/orders/ordersaccepted_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/view/widget/order/orderacceptedwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersAcceptedScreen extends StatelessWidget {
  const OrdersAcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAcceptedController());
    return Scaffold(
      body: GetBuilder<OrdersAcceptedController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.dataList.length,
            itemBuilder: (context, i) =>
                OrderAcceptedWedget(orderModel: controller.dataList[i]),
          ),
        );
      }),
    );
  }
}
