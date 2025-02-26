class ProductModel {
  int? id;
  String? name;
  int? price;
  String? img;
  String? des;
  int? cateId;

  ProductModel(
      {this.id, this.name, this.price, this.img, this.des, this.cateId});
  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    des = json['des'];
    cateId = json['cateId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['img'] = img;
    data['des'] = des;
    data['cateId'] = cateId;
    return data;
  }
}
