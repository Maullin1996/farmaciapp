import 'dart:convert';

import 'pills_firebase.dart';

FirebaseResponse firebaseResponseFromJson(String str) => FirebaseResponse.fromJson(json.decode(str));

String firebaseResponseToJson(FirebaseResponse data) => json.encode(data.toJson());

class FirebaseResponse {
    final List<PillItem> pillItems;

    FirebaseResponse({
        required this.pillItems,
    });

    factory FirebaseResponse.fromJson(Map<String, dynamic> json) => FirebaseResponse(
        pillItems: List<PillItem>.from(json["pillItems"].map((x) => PillItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pillItems": List<dynamic>.from(pillItems.map((x) => x.toJson())),
    };
}