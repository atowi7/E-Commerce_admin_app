class CategorieModel {
  String? id;
  String? name;
  String? nameAr;
  String? image;
  String? createdAt;
  CategorieModel({
    this.id,
    this.name,
    this.nameAr,
    this.image,
    this.createdAt,
  });

  CategorieModel.fromJson(Map<String, dynamic> json) {
    id = json['categorie_id'];
    name = json['categorie_name'];
    nameAr = json['categorie_name_ar'];
    image = json['categorie_image'];
    createdAt = json['categorie_createdat'];
  }

  // Map<String,dynamic> toJson(){
  //  Map<String,dynamic> data={};
  //  data['id'] = id;
  //   data['name'] = name;
  //    data['name_ar'] = name_ar;
  //     data['image'] = image;
  //     return data;
  // }
}
