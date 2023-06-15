import 'package:ecommerce_admin_app/controller/categorie/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategorieView extends StatelessWidget {
  const CategorieView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategorieViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('34'.tr),
      ),
      body: GetBuilder<CategorieViewController>(
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
                            child: SvgPicture.network(
                              '${AppLink.categrieImage}/${controller.dataList[i].image}',
                              height: 100,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text('${controller.dataList[i].name}'),
                              subtitle:
                                  Text('${controller.dataList[i].createdAt}'),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete_forever_rounded),
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: '30'.tr,
                                    middleText: '31'.tr,
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
            Get.toNamed(AppRoute.categorieAdd);
          }),
    );
  }
}
