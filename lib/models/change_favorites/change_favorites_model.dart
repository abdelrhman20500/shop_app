
class ChangeFavoritesModel {
  bool? status;
  String? message;
  Data? data;

  ChangeFavoritesModel({this.status, this.message, this.data});

  ChangeFavoritesModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  Product? product;

  Data({this.id, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["product"] is Map) {
      product = json["product"] == null ? null : Product.fromJson(json["product"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if(product != null) {
      data["product"] = product?.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toInt();
    }
    if(json["old_price"] is num) {
      oldPrice = (json["old_price"] as num).toInt();
    }
    if(json["discount"] is num) {
      discount = (json["discount"] as num).toInt();
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["price"] = price;
    data["old_price"] = oldPrice;
    data["discount"] = discount;
    data["image"] = image;
    return data;
  }
}