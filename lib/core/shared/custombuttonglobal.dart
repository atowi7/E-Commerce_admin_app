import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonGlobal extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const CustomButtonGlobal(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Get.size.width * 0.3,vertical: 5),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
        splashColor: AppColor.secondaryColor,
        onPressed: onPressed,
        child: Text(title, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }
}
