// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

List<Photos> photosFromJson(String str) =>
    List<Photos>.from(json.decode(str).map((x) => Photos.fromJson(x)));

String photosToJson(List<Photos> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photos {
  Photos({
    required this.id,
    required this.name,
    required this.services,
    required this.phone,
    required this.cost,
    required this.image,
  });

  int id;
  String name;
  String services;
  String phone;
  String cost;
  String image;

  factory Photos.fromJson(Map<String, dynamic> json) => Photos(
        id: json["id"],
        name: json["name"],
        services: json["services"],
        phone: json["phone"],
        cost: json["cost"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "services": services,
        "phone": phone,
        "cost": cost,
        "image": image,
      };
}
