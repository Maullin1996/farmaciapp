// To parse this JSON data, do
//
//     final pillItem = pillItemFromJson(jsonString);

import 'dart:convert';

PillItem pillItemFromJson(String str) => PillItem.fromJson(json.decode(str));

String pillItemToJson(PillItem data) => json.encode(data.toJson());

class PillItem {
    final List<PillItemElement> pillItems;

    PillItem({
        required this.pillItems,
    });

    factory PillItem.fromJson(Map<String, dynamic> json) => PillItem(
        pillItems: List<PillItemElement>.from(json["pillItems"].map((x) => PillItemElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pillItems": List<dynamic>.from(pillItems.map((x) => x.toJson())),
    };
}

class PillItemElement {
    final String description;
    final String id;
    final String image;
    final String name;
    final int price;

    PillItemElement({
        required this.description,
        required this.id,
        required this.image,
        required this.name,
        required this.price,
    });

    factory PillItemElement.fromJson(Map<String, dynamic> json) => PillItemElement(
        description: json["description"],
        id: json["id"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "image": image,
        "name": name,
        "price": price,
    };
}