import 'package:ecommerce_admin_app/controller/product/edit_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/function/input_validation.dart';
import 'package:ecommerce_admin_app/core/shared/custombuttonglobal.dart';
import 'package:ecommerce_admin_app/core/shared/customdropdownlist.dart';
import 'package:ecommerce_admin_app/core/shared/customtextformglobal.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductEdit extends StatelessWidget {
  const ProductEdit({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductEditController());
    return Scaffold(
      appBar: AppBar(title: Text('Edit Products')),
      body: GetBuilder<ProductEditController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                    labelText: 'Enter product name',
                    hintText: 'product name',
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.name,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter product name (Arabic)',
                    hintText: 'product name (Arabic)',
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.nameAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter description name',
                    hintText: 'Description name',
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.desc,
                    validator: (val) {
                      return inputValidation('', val!, 1, 100);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter description name (Arabic)',
                    hintText: 'Description name (Arabic)',
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.descAr,
                    validator: (val) {
                      return inputValidation('', val!, 1, 100);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter count number',
                    hintText: 'Count number',
                    icon: Icons.category,
                    isNumber: true,
                    controller: controller.count,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter price',
                    hintText: 'Price',
                    icon: Icons.category,
                    isNumber: true,
                    controller: controller.price,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter discount',
                    hintText: 'discount',
                    icon: Icons.category,
                    isNumber: true,
                    controller: controller.discount,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomDropDownList(
                    title: 'Choose categorie',
                    dataList: controller.dropDownList,
                    selectedId: controller.catId,
                    selectedName: controller.catName),
                RadioListTile(
                    title: Text('Hidden'),
                    value: '0',
                    groupValue: controller.active,
                    onChanged: (val) {
                      controller.changeActiveStatus(val);
                    }),
                RadioListTile(
                    title: Text('Active'),
                    value: '1',
                    groupValue: controller.active,
                    onChanged: (val) {
                      controller.changeActiveStatus(val);
                    }),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: MaterialButton(
                    color: AppColor.blue,
                    onPressed: () {
                      controller.chooseImageOptions();
                    },
                    child: Text('Upload image'),
                  ),
                ),
                if (controller.imageFile != null)
                  Image.file(
                    controller.imageFile!,
                    height: 100,
                    width: 100,
                  ),
                CustomButtonGlobal(
                    title: 'Save',
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
