import 'package:ecommerce_admin_app/controller/categorie/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CategorieView extends StatelessWidget {
  const CategorieView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategorieViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '34'.tr,
        ),
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
                  itemCount: controller.categorieList.length,
                  itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      controller.goToEdit(controller.categorieList[i]);
                    },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: AppColor.forthColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child:
                                controller.categorieList[i].image == "default"
                                    ? const Icon(
                                        Icons.category_rounded,
                                        size: 50,
                                      )
                                    : SvgPicture.network(
                                        '${AppLink.categrieImage}/${controller.categorieList[i].image}',
                                        height: 100,
                                      ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(
                                '${controller.categorieList[i].name}',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              subtitle: Text(
                                DateFormat('EEEE, d MMM, yyyy').format(
                                    DateTime.parse(controller
                                        .categorieList[i].createdAt!)),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete_forever_rounded,
                                  color: AppColor.primaryColor,
                                  size: 30,
                                ),
                                onPressed: () {
                                  Get.defaultDialog(
                                    title: '30'.tr,
                                    middleText: '31'.tr,
                                    onConfirm: () {
                                      controller.delete(
                                          controller.categorieList[i].id!,
                                          controller.categorieList[i].image!);
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
        onPressed: () {
          Get.toNamed(AppRoute.categorieAdd);
        },
        child: const Icon(
          Icons.add,
          color: AppColor.primaryColor,
        ),
      ),
    );
  }
}
