class Product_Model {
  int? id;
  String? name;
  int? price;
  String? img;
  String? des;
  int? catId;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': des,
      'price': price,
      'catId': catId,
      'img': img
    };
  }

  factory Product_Model.fromMap(Map<String, dynamic> map) {
    return Product_Model(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      des: map['des'] ?? '',
      price: map['price'] ?? 0,
    );
  }

  //constructor
  Product_Model(
      {this.id, this.name, this.price, this.img, this.des, this.catId});
  Product_Model.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    img = json["img"];
    des = json["des"];
    catId = json["catId"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["price"] = price;
    data["img"] = img;
    data["des"] = des;
    data["catId"] = catId;
    return data;
  }
}
