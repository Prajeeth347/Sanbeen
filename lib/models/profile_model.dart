import 'dart:convert';

List<Profiles> profilesFromJson(String str) => List<Profiles>.from(json.decode(str).map((x) => Profiles.fromJson(x)));

String profilesToJson(List<Profiles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Profiles {
    Profiles({
        this.img,
        required this.mail,
        required this.number,
        required this.name,
    });

    String? img;
    String mail;
    String number;
    String name;

    factory Profiles.fromJson(Map<String, dynamic> json) => Profiles(
        img: json["img"],
        mail: json["mail"],
        number: json["number"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "mail": mail,
        "number": number,
        "name": name,
    };
}
