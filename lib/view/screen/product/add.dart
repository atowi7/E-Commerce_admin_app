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
                    icon: Icons.inventory_2_rounded,
                    isNumber: false,
                    controller: controller.name,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '67'.tr,
                    hintText: '68'.tr,
                    icon: Icons.inventory_2_rounded,
                    isNumber: false,
                    controller: controller.nameAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '69'.tr,
                    hintText: '70'.tr,
                    icon: Icons.inventory_2_rounded,
                    isNumber: false,
                    controller: controller.desc,
                    validator: (val) {
                      return inputValidation('', val!, 1, 100);
                    }),
                CustomTextFormGlobal(
                    labelText: '71'.tr,
                    hintText: '72'.tr,
                    icon: Icons.inventory_2_rounded,
                    isNumber: false,
                    controller: controller.descAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 100);
                    }),
                CustomTextFormGlobal(
                    labelText: '137'.tr,
                    hintText: '138'.tr,
                    icon: Icons.color_lens_rounded,
                    isNumber: false,
                    controller: controller.color,
                    validator: (val) {
                      return inputValidation('', val!, 1, 20);
                    }),
                CustomTextFormGlobal(
                    labelText: '139'.tr,
                    hintText: '140'.tr,
                    icon: Icons.color_lens_rounded,
                    isNumber: false,
                    controller: controller.colorAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 20);
                    }),
                CustomTextFormGlobal(
                    labelText: '73'.tr,
                    hintText: '74'.tr,
                    icon: Icons.inventory_2_rounded,
                    isNumber: true,
                    controller: controller.count,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '75'.tr,
                    hintText: '76'.tr,
                    icon: Icons.inventory_2_rounded,
                    isNumber: true,
                    controller: controller.price,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '77'.tr,
                    hintText: '78'.tr,
                    icon: Icons.inventory_2_rounded,
                    isNumber: true,
                    controller: controller.discount,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomDropDownList(
                  context: context,
                  title: '141'.tr,
                  dataList: controller.paymentdropDownList,
                  selectedId: controller.paymentId,
                  selectedName: controller.paymentName,
                  icon: Icons.payment_rounded,
                ),
                CustomDropDownList(
                  context: context,
                  title: '79'.tr,
                  dataList: controller.catdropDownList,
                  selectedId: controller.catId,
                  selectedName: controller.catName,
                  icon: Icons.category,
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: Get.size.width * 0.3),
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(25)),
                  child: MaterialButton(
                    splashColor: AppColor.secondaryColor,
                    onPressed: () {
                      controller.chooseImageOptions(context);
                    },
                    child: Text(
                      '61'.tr,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
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
