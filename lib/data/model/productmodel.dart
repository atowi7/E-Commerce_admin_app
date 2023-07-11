class ProductModel {
  String? id;
  String? name;
  String? nameAr;
  String? description;
  String? descriptionAr;
  String? image;
  String? price;
  String? discount;
  String? active;
  String? count;
  String? createdAt;
  String? categorieId;
  String? cId;
  String? cName;
  String? cNameAr;
  String? cImage;
  String? ccreatedAt;
  String? favorite;
  String? priceafterdiscount;
  ProductModel({
    this.id,
    this.name,
    this.nameAr,
    this.description,
    this.descriptionAr,
    this.image,
    this.price,
    this.discount,
    this.active,
    this.count,
    this.createdAt,
    this.categorieId,
    this.cId,
    this.cName,
    this.cNameAr,
    this.cImage,
    this.ccreatedAt,
    this.favorite,
    this.priceafterdiscount,
  });
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['pro_id'];
    name = json['pro_name'];
    nameAr = json['pro_name_ar'];
    description = json['pro_desc'];
    descriptionAr = json['pro_desc_ar'];
    image = json['pro_image'];
    price = json['pro_price'];
    discount = json['pro_discount'];
    active = json['pro_active'];
    count = json['pro_count'];
    createdAt = json['pro_createdat'];
    categorieId = json['pro_categorie_id'];
    cId = json['categorie_id'];
    cName = json['categorie_name'];
    cNameAr = json['categorie_name_ar'];
    cImage = json['categorie_image'];
    ccreatedAt = json['categorie_createdat'];
    favorite = json['favorite'];
    priceafterdiscount = json['priceafterdiscount'];
  }
}
