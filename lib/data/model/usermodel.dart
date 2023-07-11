class UserModel {
  String? id;
  String? name;
  String? email;
  String? pass;
  String? phone;
  String? image;
  String? createdAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.pass,
    this.phone,
    this.image,
    this.createdAt,
  });

  UserModel.fromJson(json) {
    id = json['user_id'];
    name = json['user_name'];
    email = json['user_email'];
    pass = json['user_pass'];
    phone = json['user_phone'];
    image = json['user_image'];
    createdAt = json['user_createdat'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['user_id'] = id;
  //   data['user_name'] = name;
  //   data['user_email'] = email;
  //   data['user_pass'] = pass;
  //   data['user_phone'] = phone;
  //   data['user_image'] = image;
  //   data['user_createdat'] = createdAt;
  //   return data;
  // }
}
