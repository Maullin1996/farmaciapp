
class PillItem {
    final String description;
    final String id;
    final String image;
    final String name;
    final int price;

    PillItem({
        required this.description,
        required this.id,
        required this.image,
        required this.name,
        required this.price,
    });

    factory PillItem.fromJson(Map<String, dynamic> json) => PillItem(
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