class AdminModel {
  String? id;
  String? name;
  String? email;
  String? pass;
  String? phone;
  String? image;
  String? createdAt;

  AdminModel({
    this.id,
    this.name,
    this.email,
    this.pass,
    this.phone,
    this.image,
    this.createdAt,
  });

  AdminModel.fromJson(json) {
    id = json['admin_id'];
    name = json['admin_name'];
    email = json['admin_email'];
    pass = json['admin_pass'];
    phone = json['admin_phone'];
    image = json['admin_image'];
    createdAt = json['admin_createdat'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = {};
  //   data['admin_id'] = id;
  //   data['admin_name'] = name;
  //   data['admin_email'] = email;
  //   data['admin_pass'] = pass;
  //   data['admin_phone'] = phone;
  //   data['admin_image'] = image;
  //   data['admin_createdat'] = createdAt;
  //   return data;
  // }
}
