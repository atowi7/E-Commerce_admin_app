import 'package:ecommerce_admin_app/view/screen/orders/ordersaccepted.dart';
import 'package:ecommerce_admin_app/view/screen/orders/ordersarchive.dart';
import 'package:ecommerce_admin_app/view/screen/orders/orderspending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseOrderScreenController extends GetxController {
  changePage(int i);
}

class OrderScreenController extends BaseOrderScreenController {
  int currentPage = 0;
  List icons = [
    {
      'title': 'Pendinging',
      'icon': Icons.lock_clock_outlined,
    },
    {
      'title': 'Accepted',
      'icon': Icons.done,
    },
    {
      'title': 'Archive',
      'icon': Icons.archive_outlined,
    },
  ];
  List<Widget> pages = [
    const OrdersPendingScreen(),
    const OrdersAcceptedScreen(),
    const OrdersArchiveScreen(),
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
