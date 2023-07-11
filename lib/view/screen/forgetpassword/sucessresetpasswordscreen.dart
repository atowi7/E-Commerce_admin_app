import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessResetPasswordScreen extends StatelessWidget {
  const SucessResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '127'.tr,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              size: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '128'.tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                title: '21'.tr,
                onPressed: () {
                  Get.offNamed(AppRoute.login);
                }),
          ],
        ),
      ),
    );
  }
}
