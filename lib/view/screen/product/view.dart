import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_app/controller/product/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('35'.tr),
      ),
      body: GetBuilder<ProductViewController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.back();
                },
                child: ListView.builder(
                  itemCount: controller.productList.length,
                  itemBuilder: (context, i) => InkWell(
                    splashColor: AppColor.secondaryColor,
                    onTap: () {
                      controller.goToEdit(controller.productList[i]);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: AppColor.forthColor,
                      shadowColor: AppColor.secondaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: Get.size.height * 0.2,
                            width: Get.size.height * 0.2,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            child: controller.productList[i].image == ""
                                ? const Icon(
                                    Icons.inventory_2_rounded,
                                    size: 50,
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        '${AppLink.productImage}/${controller.productList[i].image}',
                                    height: 100,
                                  ),
                          ),
                          Text(
                            '${controller.productList[i].name}',
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          Text(
                            '${controller.productList[i].cName}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          Text(
                            '${DateFormat('EEEE, d MMM, yyyy').format(DateTime.parse(controller.productList[i].createdAt!))}',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.delete_forever_rounded,
                              color: AppColor.primaryColor,
                              size: 40,
                            ),
                            onPressed: () {
                              Get.defaultDialog(
                                title: '30'.tr,
                                middleText: '31'.tr,
                                onConfirm: () {
                                  controller.delete(
                                      controller.productList[i].id!,
                                      controller.productList[i].image!);
                                  Get.back();
                                },
                                onCancel: () {},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoute.productAdd);
        },
        child: const Icon(
          Icons.add,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
