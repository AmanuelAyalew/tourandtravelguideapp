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
    required this.created,
  });

  int id;
  String name;
  String image;
  String atractionType;
  String detial;
  DateTime created;

  factory Toursite.fromJson(Map<String, dynamic> json) => Toursite(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        atractionType: json["atractionType"],
        detial: json["detial"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "atractionType": atractionType,
        "detial": detial,
        "created": created.toIso8601String(),
      };
}
