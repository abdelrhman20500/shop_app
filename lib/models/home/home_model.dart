
class HomeModel {
  bool? status;
  dynamic message;
  Data? data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is bool) {
      status = json["status"];
    }
    message = json["message"];
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
  List<Banners>? banners;
  List<Products>? products;
  String? ad;

  Data({this.banners, this.products, this.ad});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["banners"] is List) {
      banners = json["banners"] == null ? null : (json["banners"] as List).map((e) => Banners.fromJson(e)).toList();
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
    if(json["ad"] is String) {
      ad = json["ad"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(banners != null) {
      data["banners"] = banners?.map((e) => e.toJson()).toList();
    }
    if(products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    data["ad"] = ad;
    return data;
  }
}

class Products {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products({this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description, this.images, this.inFavorites, this.inCart});

  Products.fromJson(Map<String, dynamic> json) {
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
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
    if(json["in_favorites"] is bool) {
      inFavorites = json["in_favorites"];
    }
    if(json["in_cart"] is bool) {
      inCart = json["in_cart"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["price"] = price;
    data["old_price"] = oldPrice;
    data["discount"] = discount;
    data["image"] = image;
    data["name"] = name;
    data["description"] = description;
    if(images != null) {
      data["images"] = images;
    }
    data["in_favorites"] = inFavorites;
    data["in_cart"] = inCart;
    return data;
  }
}

class Banners {
  int? id;
  String? image;
  dynamic category;
  dynamic product;

  Banners({this.id, this.image, this.category, this.product});

  Banners.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    category = json["category"];
    product = json["product"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["image"] = image;
    data["category"] = category;
    data["product"] = product;
    return data;
  }
}