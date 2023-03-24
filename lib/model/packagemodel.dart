// To parse this JSON data, do
//
//     final package = packageFromJson(jsonString);

import 'dart:convert';

List<Package> packageFromJson(String str) =>
    List<Package>.from(json.decode(str).map((x) => Package.fromJson(x)));

String packageToJson(List<Package> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Package {
  Package({
    required this.id,
    required this.service,
    required this.created,
    required this.cost,
    required this.touristSite,
    required this.hotel,
  });

  int id;
  String service;
  DateTime created;
  String cost;
  int touristSite;
  int hotel;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        service: json["service"],
        created: DateTime.parse(json["created"]),
        cost: json["cost"],
        touristSite: json["touristSite"],
        hotel: json["hotel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "service": service,
        "created": created.toIso8601String(),
        "cost": cost,
        "touristSite": touristSite,
        "hotel": hotel,
      };
}
