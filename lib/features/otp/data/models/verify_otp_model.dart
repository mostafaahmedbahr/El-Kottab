
class VerifyOtpModel {
  String? message;
  int? status;
  Data? data;

  VerifyOtpModel({this.message, this.status, this.data});

  VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? country;
  String? city;
  String? token;

  Data({this.id, this.name, this.email, this.phone, this.image, this.country, this.city, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    country = json["country"];
    city = json["city"];
    token = json["token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["image"] = image;
    _data["country"] = country;
    _data["city"] = city;
    _data["token"] = token;
    return _data;
  }
}