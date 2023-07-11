import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDropDownList extends StatelessWidget {
  final BuildContext context;
  final String title;
  final List<SelectedListItem> dataList;
  final TextEditingController selectedId;
  final TextEditingController selectedName;
  final IconData icon;
  const CustomDropDownList({
    super.key,
    required this.context,
    required this.title,
    required this.dataList,
    required this.selectedId,
    required this.selectedName,
    required this.icon,
  });

  void showDrobDownList() {
    DropDownState(
      DropDown(
        bottomSheetTitle:
            Text(title, style: Theme.of(context).textTheme.displayMedium),
        submitButtonChild: Text(
          '83'.tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: dataList ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          selectedId.text = selectedListItem.value!;
          selectedName.text = selectedListItem.name;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextFormField(
        controller: selectedName,
        onTap: () {
          showDrobDownList();
        },
        style: Theme.of(context).textTheme.displayMedium,
        decoration: InputDecoration(
            label: Text(
              selectedName.text == '' ? title : selectedName.text,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: selectedName.text == '' ? title : selectedName.text,
            hintStyle: Theme.of(context).textTheme.displayMedium,
            suffixIcon: Icon(
              icon,
              color: AppColor.primaryColor,
            ),
            //suffixIcon: InkWell(onTap: onTapIcon, child: Icon(icon)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
              20,
            ))),
      ),
    );
  }
}
