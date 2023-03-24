// To parse this JSON data, do
//
//     final toursite = toursiteFromJson(jsonString);

import 'dart:convert';

List<Toursite> toursiteFromJson(String str) =>
    List<Toursite>.from(json.decode(str).map((x) => Toursite.fromJson(x)));

String toursiteToJson(List<Toursite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Toursite {
  Toursite({
    required this.id,
    required this.name,
    required this.image,
    required this.atractionType,
    required this.detial,
  });

  int id;
  String name;
  String image;
  String atractionType;
  String detial;

  factory Toursite.fromJson(Map<String, dynamic> json) => Toursite(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        atractionType: json["atractionType"],
        detial: json["detial"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "atractionType": atractionType,
        "detial": detial,
      };
}
