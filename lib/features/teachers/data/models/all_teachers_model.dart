
class AllTeachersModel {
  String? message;
  int? status;
  List<AllTeachersData>? data;
  bool? hasMorePage;

  AllTeachersModel({this.message, this.status, this.data, this.hasMorePage});

  AllTeachersModel.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    status = json["status"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => AllTeachersData.fromJson(e)).toList();
    hasMorePage = json["hasMorePage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["message"] = message;
    _data["status"] = status;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    _data["hasMorePage"] = hasMorePage;
    return _data;
  }
}

class AllTeachersData {
  int? id;
  String? name;
  String? image;
  List<String>? languages;
  String? category;
  String? phone;
  dynamic rate;
  bool? isFav;

  AllTeachersData({this.id, this.name, this.image, this.languages, this.category, this.phone, this.rate, this.isFav});

  AllTeachersData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    languages = json["languages"] == null ? null : List<String>.from(json["languages"]);
    category = json["category"];
    phone = json["phone"];
    rate = json["rate"];
    isFav = json["is_fav"];
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
    _data["phone"] = phone;
    _data["rate"] = rate;
    _data["is_fav"] = isFav;
    return _data;
  }
}