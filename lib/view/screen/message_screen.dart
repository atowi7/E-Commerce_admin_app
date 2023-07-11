import 'package:ecommerce_admin_app/controller/message_controller.dart';
import 'package:ecommerce_admin_app/core/class/handlingdataview.dart';
import 'package:ecommerce_admin_app/core/constant/color.dart';
import 'package:ecommerce_admin_app/data/model/messagemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MessageController());
    return Scaffold(
      appBar: AppBar(title: Text('117'.tr)),
      body: GetBuilder<MessageController>(builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              ...List.generate(
                  controller.dataList.length,
                  (index) => MessageWidget(
                      messageModel: controller.dataList[index],
                      onDelete: () {
                        Get.defaultDialog(
                          title: '30'.tr,
                          titleStyle: Theme.of(context).textTheme.displayMedium,
                          middleText: '31'.tr,
                          middleTextStyle:
                              Theme.of(context).textTheme.displaySmall,
                          onConfirm: () {
                            controller.deleteData(
                                controller.dataList[index].messageId!);
                          },
                          confirmTextColor: AppColor.primaryColor,
                          cancelTextColor: AppColor.primaryColor,
                          buttonColor: AppColor.secondaryColor,
                          onCancel: () {
                            Get.back();
                          },
                        );
                      })),
            ],
          ),
        );
      }),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final MessageModel messageModel;
  final void Function()? onDelete;
  const MessageWidget(
      {super.key, required this.messageModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
          title: Text(
            '${messageModel.messageTitle}',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          subtitle: Column(
            children: [
              Text(
                '${messageModel.messageBody}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(Jiffy.parse(messageModel.messagecreatedAt!).fromNow(),
                  style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
          trailing: IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_forever_rounded))),
    );
  }
}
