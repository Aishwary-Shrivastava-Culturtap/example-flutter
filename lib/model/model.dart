import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.phoneNO,
  });

  int id;
  String name;
  String phoneNO;

 

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        phoneNO: json["phone_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phoneNO": phoneNO,
      };
}