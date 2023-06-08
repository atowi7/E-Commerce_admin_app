import 'package:ecommerce_admin_app/core/constant/imageassets.dart';
import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  final String image;
  final String title;
  final void Function()? onTap;
  const AdminCard(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.asset(
              image,
              height: 70,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
