import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  final String title;
  final List<SelectedListItem> dataList;
  final TextEditingController selectedId;
  final TextEditingController selectedName;
  const CustomDropDownList(
      {super.key,
      required this.title,
      required this.dataList,
      required this.selectedId,
      required this.selectedName});

  @override
  State<CustomDropDownList> createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  void showDrobDownList() {
    DropDownState(
      DropDown(
        bottomSheetTitle: Text(
          widget.title,
          style: const TextStyle(
            color: AppColor.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.dataList ?? [],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          widget.selectedId.text = selectedListItem.value!;
          widget.selectedName.text = selectedListItem.name;
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.selectedName,
      onTap: () {
        showDrobDownList();
      },
      decoration: InputDecoration(
          label: Text(
            widget.selectedName.text == ''
                ? widget.title
                : widget.selectedName.text,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: widget.selectedName.text == ''
              ? widget.title
              : widget.selectedName.text,
          //suffixIcon: InkWell(onTap: onTapIcon, child: Icon(icon)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
            20,
          ))),
    );
  }
}
