import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormGlobal extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final bool isNumber;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function()? onTapIcon;
  const CustomTextFormGlobal({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.isNumber,
    this.obscureText,
    required this.controller,
    required this.validator,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextFormField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        obscureText: obscureText == null || false ? false : true,
        controller: controller,
        validator: validator,
        style: Theme.of(context).textTheme.displayMedium,
        decoration: InputDecoration(
            label: Text(
              labelText,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.displayMedium,
            suffixIcon: InkWell(
                onTap: onTapIcon,
                child: Icon(
                  icon,
                  color: AppColor.primaryColor,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
              20,
            ))),
      ),
    );
  }
}
