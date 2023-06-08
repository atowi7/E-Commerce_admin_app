import 'dart:io';

import 'package:ecommerce_admin_app/controller/orderscreen_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/view/widget/order/custombottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersHomeScreen extends StatelessWidget {
  const OrdersHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: GetBuilder<OrderScreenController>(builder: (controller) {
        return Container(
          child: controller.pages.elementAt(controller.currentPage),
        );
      }),
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
