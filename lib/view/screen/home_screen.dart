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
        title: Text('Home'),
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
              AdminCard(image: ImageAssets.logo, title: 'Users', onTap: () {}),
              AdminCard(
                  image: ImageAssets.logo,
                  title: 'Categories',
                  onTap: () {
                    Get.toNamed(AppRoute.categorieView);
                  }),
              AdminCard(
                  image: ImageAssets.logo,
                  title: 'Profucts',
                  onTap: () {
                    Get.toNamed(AppRoute.productView);
                  }),
              AdminCard(
                  image: ImageAssets.logo,
                  title: 'Orders',
                  onTap: () {
                    Get.toNamed(AppRoute.ordersHome);
                  }),
              AdminCard(
                  image: ImageAssets.logo, title: 'Messages', onTap: () {}),
              AdminCard(
                  image: ImageAssets.logo,
                  title: 'Notifications',
                  onTap: () {}),
            ],
          )
        ],
      ),
    );
  }
}
