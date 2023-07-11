class MessageModel {
  String? messageId;
  String? messageTitle;
  String? messageBody;
  String? messagecreatedAt;
  String? messageUserid;

  MessageModel({
    this.messageId,
    this.messageTitle,
    this.messageBody,
    this.messagecreatedAt,
  });

  MessageModel.fromJson(json) {
    messageId = json['message_id'];
    messageTitle = json['message_title'];
    messageBody = json['message_body'];
    messagecreatedAt = json['message_createdat'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['message_id'] = messageId;
  //   data['message_title'] = messageTitle;
  //   data['message_body'] = messageBody;
  //   data['message_createdat'] = messagecreatedAt;
  //   data['message_userid'] = messageUserid;
  //   return data;
  // }
}
