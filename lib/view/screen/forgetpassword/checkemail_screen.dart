import 'package:ecommerce_admin_app/controller/forgetpassword/checkemail_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/function/input_validation.dart';
import 'package:ecommerce_admin_app/view/widget/auth/custombutton.dart';
import 'package:ecommerce_admin_app/view/widget/auth/customtextbody.dart';
import 'package:ecommerce_admin_app/view/widget/auth/customtextform.dart';
import 'package:ecommerce_admin_app/view/widget/auth/customtexttitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckemailScreen extends StatelessWidget {
  const CheckemailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckEmailController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '22'.tr,
        ),
      ),
      body: GetBuilder<CheckEmailController>(builder: (controller) {
        return HandlingDataReqest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                // const Logo(),
                const Icon(
                  Icons.email_rounded,
                  size: 200,
                  color: AppColor.primaryColor,
                ),
                CustomTextTitle(title: '22'.tr),
                CustomTextBody(title: '23'.tr),
                CustomTextForm(
                  labelText: '7'.tr,
                  hintText: '7'.tr,
                  icon: Icons.email,
                  isNumber: false,
                  controller: controller.email,
                  validator: (val) {
                    return inputValidation('email', val!, 10, 50);
                  },
                ),
                CustomButton(
                  title: '24'.tr,
                  onPressed: () {
                    controller.openVerfication();
                  },
                ),
                CustomButton(
                  title: '132'.tr,
                  onPressed: () {
                    controller.backTologin();
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
