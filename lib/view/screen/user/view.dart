import 'package:ecommerce_admin_app/controller/user/view_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/applink.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UserViewController());
    return Scaffold(
      appBar: AppBar(
        title: Text('33'.tr),
      ),
      body: GetBuilder<UserViewController>(
        builder: (controller) {
          return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: WillPopScope(
                onWillPop: () {
                  return controller.back();
                },
                child: ListView.builder(
                  itemCount: controller.userList.length,
                  itemBuilder: (context, i) => InkWell(
                    // onTap: () {
                    //   controller.goToEdit(controller.userList[i]);
                    // },
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: AppColor.forthColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: controller.userList[i].image == "default"
                                ? const Icon(
                                    Icons.person_2_rounded,
                                    size: 50,
                                  )
                                : SvgPicture.network(
                                    '${AppLink.categrieImage}/${controller.userList[i].image}',
                                    height: 100,
                                  ),
                          ),
                          Expanded(
                            flex: 3,
                            child: ListTile(
                              title: Text(
                                '${controller.userList[i].name}',
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                              subtitle: Text(
                                DateFormat('EEEE, d MMM, yyyy').format(
                                    DateTime.parse(
                                        controller.userList[i].createdAt!)),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              // trailing: IconButton(
                              //   icon: const Icon(
                              //     Icons.delete_forever_rounded,
                              //     color: AppColor.primaryColor,
                              //     size: 30,
                              //   ),
                              //   onPressed: () {
                              //     Get.defaultDialog(
                              //       title: '30'.tr,
                              //       middleText: '31'.tr,
                              //       onConfirm: () {
                              //         controller.delete(
                              //             controller.userList[i].id!,
                              //             controller.userList[i].image!);
                              //         Get.back();
                              //       },
                              //       onCancel: () {},
                              //     );
                              //   },
                              // ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.toNamed(AppRoute.userAdd);
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     color: AppColor.primaryColor,
      //   ),
      // ),
    );
  }
}
