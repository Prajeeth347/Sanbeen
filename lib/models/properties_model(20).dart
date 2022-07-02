import 'dart:convert';

List<Properties> propertiesFromJson(String str) => List<Properties>.from(json.decode(str).map((x) => Properties.fromJson(x)));

String propertiesToJson(List<Properties> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Properties {
    Properties({
        required this.img,
        required this.name,
        required this.bedrooms,
        required this.baths,
        required this.sft,
        required this.price,
        required this.dealer,
        required this.contact,
    });

    String img;
    String name;
    int bedrooms;
    int baths;
    int sft;
    String price;
    String dealer;
    String contact;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        img: json["img"],
        name: json["Name"],
        bedrooms: json["Bedrooms"],
        baths: json["Baths"],
        sft: json["sft"],
        price: json["price"],
        dealer: json["dealer"],
        contact: json["contact"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "Name": name,
        "Bedrooms": bedrooms,
        "Baths": baths,
        "sft": sft,
        "price": price,
        "dealer": dealer,
        "contact": contact,
    };
}
