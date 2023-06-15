import 'package:ecommerce_admin_app/core/constant/route.dart';
import 'package:ecommerce_admin_app/view/widget/auth/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessSignupScreen extends StatelessWidget {
  const SucessSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text('19'.tr),
      ),
      body: Center(
        child: Column(
          children: [
             Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
              size: 350,
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              '20'.tr,
              style: const TextStyle(fontSize: 30),
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
