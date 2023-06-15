import 'package:ecommerce_admin_app/controller/home_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/imageassets.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/view/widget/home/admincard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeScreenController homeController = Get.put(HomeScreenController());
    return Scaffold(
      appBar: AppBar(
        title: Text('32'.tr),
      ),
      body: ListView(
        children: [
          GridView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisExtent: 100,
            ),
            children: [
              AdminCard(image: ImageAssets.logo, title: '33'.tr, onTap: () {}),
              AdminCard(
                  image: ImageAssets.logo,
                  title: '34'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.categorieView);
                  }),
              AdminCard(
                  image: ImageAssets.logo,
                  title: '35'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.productView);
                  }),
              AdminCard(
                  image: ImageAssets.logo,
                  title: '36'.tr,
                  onTap: () {
                    Get.toNamed(AppRoute.ordersHome);
                  }),
              AdminCard(image: ImageAssets.logo, title: '37'.tr, onTap: () {}),
              AdminCard(image: ImageAssets.logo, title: '38'.tr, onTap: () {}),
            ],
          )
        ],
      ),
    );
  }
}
