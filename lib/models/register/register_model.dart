
class RegisterModel {
  bool? status;
  String? message;
  Data? data;

  RegisterModel({this.status, this.message, this.data});

  RegisterModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phone;
  String? email;
  int? id;
  String? image;
  String? token;

  Data({this.name, this.phone, this.email, this.id, this.image, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["phone"] is String) {
      phone = json["phone"];
    }
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["token"] is String) {
      token = json["token"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["id"] = id;
    data["image"] = image;
    data["token"] = token;
    return data;
  }
}