import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_admin_app/controller/Product/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
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
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      controller.goToEdit(controller.dataList[i]);
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CachedNetworkImage(
                              imageUrl:
                                  '${AppLink.productImage}/${controller.dataList[i].image}',
                              height: 100,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text('${controller.dataList[i].name}'),
                              subtitle: Text('${controller.dataList[i].cName}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_forever_rounded),
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: 'Warrning',
                                    middleText: 'Are you sure?',
                                    onConfirm: () {
                                      controller.delete(
                                          controller.dataList[i].id!,
                                          controller.dataList[i].image!);
                                      Get.back();
                                    },
                                    onCancel: () {},
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoute.productAdd);
          }),
    );
  }
}
