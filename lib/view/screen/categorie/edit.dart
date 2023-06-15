import 'package:ecommerce_admin_app/controller/categorie/edit_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/function/input_validation.dart';
import 'package:ecommerce_admin_app/core/shared/custombuttonglobal.dart';
import 'package:ecommerce_admin_app/core/shared/customtextformglobal.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategorieEdit extends StatelessWidget {
  const CategorieEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategorieEditController());
    return Scaffold(
      appBar: AppBar(title: Text('63'.tr)),
      body: GetBuilder<CategorieEditController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                    labelText: '57'.tr,
                    hintText: '58'.tr,
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.name,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: '59'.tr,
                    hintText: '60'.tr,
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.nameAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    color: AppColor.blue,
                    onPressed: () {
                      controller.chooseImage();
                    },
                    child: Text('61'.tr),
                  ),
                ),
                if (controller.imageFile != null)
                  SvgPicture.file(controller.imageFile!),
                CustomButtonGlobal(
                    title: '29'.tr,
                    onPressed: () {
                      controller.edit();
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
