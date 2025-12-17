
class BestTeachersModel {
  String? message;
  int? status;
  List<Data>? data;

  BestTeachersModel({this.message, this.status, this.data});

  BestTeachersModel.fromJson(Map<String, dynamic> json) {
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
  List<String>? languages;
  String? category;
  int? rate;

  Data({this.id, this.name, this.image, this.languages, this.category, this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    languages = json["languages"] == null ? null : List<String>.from(json["languages"]);
    category = json["category"];
    rate = json["rate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    if(languages != null) {
      _data["languages"] = languages;
    }
    _data["category"] = category;
    _data["rate"] = rate;
    return _data;
  }
}