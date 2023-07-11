class NotificationModel {
  String? notificationId;
  String? notificationTitle;
  String? notificationBody;
  String? notificationcreatedAt;
  String? notificationUserid;

  NotificationModel({
    this.notificationId,
    this.notificationTitle,
    this.notificationBody,
    this.notificationcreatedAt,
  });

  NotificationModel.fromJson(json) {
    notificationId = json['notification_id'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    notificationcreatedAt = json['notification_createdat'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['notification_id'] = notificationId;
  //   data['notification_title'] = notificationTitle;
  //   data['notification_body'] = notificationBody;
  //   data['notification_createdat'] = notificationcreatedAt;
  //   data['notification_userid'] = notificationUserid;
  //   return data;
  // }
}
