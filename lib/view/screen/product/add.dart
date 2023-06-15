import 'package:ecommerce_admin_app/controller/product/add_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/function/input_validation.dart';
import 'package:ecommerce_admin_app/core/shared/custombuttonglobal.dart';
import 'package:ecommerce_admin_app/core/shared/customdropdownlist.dart';
import 'package:ecommerce_admin_app/core/shared/customtextformglobal.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductAdd extends StatelessWidget {
  const ProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductAddController());
    return Scaffold(
      appBar: AppBar(title: Text('64'.tr)),
      body: GetBuilder<ProductAddController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                    labelText: '65'.tr,
                    hintText: '66'.tr,
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.name,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '67'.tr,
                    hintText: '68'.tr,
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.nameAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '69'.tr,
                    hintText: '70'.tr,
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.desc,
                    validator: (val) {
                      return inputValidation('', val!, 1, 100);
                    }),
                CustomTextFormGlobal(
                    labelText: '71'.tr,
                    hintText: '72'.tr,
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.descAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 100);
                    }),
                CustomTextFormGlobal(
                    labelText: '73'.tr,
                    hintText: '74'.tr,
                    icon: Icons.category,
                    isNumber: true,
                    controller: controller.count,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '75'.tr,
                    hintText: '76'.tr,
                    icon: Icons.category,
                    isNumber: true,
                    controller: controller.price,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '77'.tr,
                    hintText: '78'.tr,
                    icon: Icons.category,
                    isNumber: true,
                    controller: controller.discount,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomDropDownList(
                    title: '79'.tr,
                    dataList: controller.dropDownList,
                    selectedId: controller.catId,
                    selectedName: controller.catName),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    color: AppColor.blue,
                    onPressed: () {
                      controller.chooseImageOptions();
                    },
                    child: Text('61'.tr),
                  ),
                ),
                if (controller.imageFile != null)
                  Image.file(
                    controller.imageFile!,
                    height: 100,
                    width: 100,
                  ),
                CustomButtonGlobal(
                    title: '62'.tr,
                    onPressed: () {
                      controller.add();
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
