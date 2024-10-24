
class FavoritesModel {
  bool? status;
  dynamic message;
  Data? data;

  FavoritesModel({this.status, this.message, this.data});

  FavoritesModel.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<FavoritesData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({this.currentPage, this.data, this.firstPageUrl, this.from, this.lastPage, this.lastPageUrl, this.nextPageUrl, this.path, this.perPage, this.prevPageUrl, this.to, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["current_page"] is num) {
      currentPage = (json["current_page"] as num).toInt();
    }
    if(json["data"] is List) {
      data = json["data"] == null ? null : (json["data"] as List).map((e) => FavoritesData.fromJson(e)).toList();
    }
    if(json["first_page_url"] is String) {
      firstPageUrl = json["first_page_url"];
    }
    if(json["from"] is num) {
      from = (json["from"] as num).toInt();
    }
    if(json["last_page"] is num) {
      lastPage = (json["last_page"] as num).toInt();
    }
    if(json["last_page_url"] is String) {
      lastPageUrl = json["last_page_url"];
    }
    nextPageUrl = json["next_page_url"];
    if(json["path"] is String) {
      path = json["path"];
    }
    if(json["per_page"] is num) {
      perPage = (json["per_page"] as num).toInt();
    }
    prevPageUrl = json["prev_page_url"];
    if(json["to"] is num) {
      to = (json["to"] as num).toInt();
    }
    if(json["total"] is num) {
      total = (json["total"] as num).toInt();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["current_page"] = currentPage;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["first_page_url"] = firstPageUrl;
    _data["from"] = from;
    _data["last_page"] = lastPage;
    _data["last_page_url"] = lastPageUrl;
    _data["next_page_url"] = nextPageUrl;
    _data["path"] = path;
    _data["per_page"] = perPage;
    _data["prev_page_url"] = prevPageUrl;
    _data["to"] = to;
    _data["total"] = total;
    return _data;
  }
}

class FavoritesData {
  int? id;
  Product? product;

  FavoritesData({this.id, this.product});

  FavoritesData.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["product"] is Map) {
      product = json["product"] == null ? null : Product.fromJson(json["product"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    if(product != null) {
      _data["product"] = product?.toJson();
    }
    return _data;
  }
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product({this.id, this.price, this.oldPrice, this.discount, this.image, this.name, this.description});

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
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["price"] = price;
    _data["old_price"] = oldPrice;
    _data["discount"] = discount;
    _data["image"] = image;
    _data["name"] = name;
    _data["description"] = description;
    return _data;
  }
}