class TeachersDetailsModel {
  String? message;
  int? status;
  Data? data;

  TeachersDetailsModel({this.message, this.status, this.data});

  TeachersDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? gender;
  String? summary;
  List<String>? language;
  String? category;
  List<String>? attachments;
  String? country;
  bool? isFav;

  Data({this.id, this.name, this.email, this.phone, this.image, this.gender, this.summary, this.language, this.category, this.attachments, this.country, this.isFav});

  Data.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    phone = json["phone"];
    image = json["image"];
    gender = json["gender"];
    summary = json["summary"];
    language = json["language"] == null ? null : List<String>.from(json["language"]);
    category = json["category"];
    attachments = json["attachments"] == null ? null : List<String>.from(json["attachments"]);
    country = json["country"];
    isFav = json["is_fav"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["email"] = email;
    _data["phone"] = phone;
    _data["image"] = image;
    _data["gender"] = gender;
    _data["summary"] = summary;
    if(language != null) {
      _data["language"] = language;
    }
    _data["category"] = category;
    if(attachments != null) {
      _data["attachments"] = attachments;
    }
    _data["country"] = country;
    _data["is_fav"] = isFav;
    return _data;
  }
}