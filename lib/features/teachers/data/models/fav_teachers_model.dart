
class FavTeachersModel {
  String? message;
  int? status;
  List<Data>? data;

  FavTeachersModel({this.message, this.status, this.data});

  FavTeachersModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? id;
  String? name;
  String? image;
  dynamic languages;
  dynamic category;
  String? phone;
  int? rate;

  Data({this.id, this.name, this.image, this.languages, this.category, this.phone, this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    languages = json["languages"];
    category = json["category"];
    phone = json["phone"];
    rate = json["rate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["languages"] = languages;
    _data["category"] = category;
    _data["phone"] = phone;
    _data["rate"] = rate;
    return _data;
  }
}