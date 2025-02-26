class RealmeModel {
  int? id;
  String? name;
  String? img;
  int? price;
  int? cateId;

  RealmeModel({this.id, this.name, this.img, this.price, this.cateId});

  RealmeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    price = json['price'];
    cateId = json['cateId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> realme = <String, dynamic>{};
    realme['id'] = id;
    realme['name'] = name;
    realme['img'] = img;
    realme['price'] = price;
    realme['cateId'] = cateId;
    return realme;
  }
}
