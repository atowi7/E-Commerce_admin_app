import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;
  const AdminCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: AppColor.secondaryColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppColor.primaryColor,
              size: 50,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
    );
  }
}
