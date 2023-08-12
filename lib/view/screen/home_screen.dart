import 'package:ecommerce_admin_app/controller/home_controller.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/view/widget/home/admincard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '32'.tr,
        ),
      ),
      body: ListView(
        children: [
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
            ),
            children: [
              AdminCard(
                icon: Icons.person_2_rounded,
                title: '33'.tr,
                onTap: () {
                  Get.toNamed(AppRoute.userView);
                },
              ),
              AdminCard(
                  icon: Icons.category_rounded,
                  title: '34'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.categorieView);
                  }),
              AdminCard(
                  icon: Icons.inventory,
                  title: '35'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.productView);
                  }),
              AdminCard(
                  icon: Icons.inventory_2_rounded,
                  title: '36'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.ordersHome);
                  }),
              AdminCard(
                icon: Icons.message_rounded,
                title: '37'.tr,
                onTap: () {
                  Get.toNamed(AppRoute.message);
                },
              ),
              AdminCard(
                icon: Icons.notifications_active_rounded,
                title: '38'.tr,
                onTap: () {
                  Get.toNamed(AppRoute.notification);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
