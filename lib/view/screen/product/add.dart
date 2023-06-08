import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app/controller/product/add_controller.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/function/input_validation.dart';
import 'package:ecommerce_admin_app/core/shared/custombuttonglobal.dart';
import 'package:ecommerce_admin_app/core/shared/customdropdownlist.dart';
import 'package:ecommerce_admin_app/core/shared/customtextformglobal.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductAdd extends StatelessWidget {
  const ProductAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductAddController());
    return Scaffold(
      appBar: AppBar(title: Text('Add Products')),
      body: GetBuilder<ProductAddController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: ListView(
              children: [
                CustomTextFormGlobal(
                    labelText: 'Enter product name',
                    hintText: 'Product name',
                    icon: Icons.category,
                    isNumber: false,
                    controller: controller.name,
                    validator: (val) {
                      return inputValidation('', val!, 1, 30);
                    }),
                CustomTextFormGlobal(
                    labelText: 'Enter product name (Arabic)',
                    hintText: 'Product name (Arabic)',
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
                    title: 'Add',
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
