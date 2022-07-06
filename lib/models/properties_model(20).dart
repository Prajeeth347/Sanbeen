// To parse this JSON data, do
//
//     final properties = propertiesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Properties> propertiesFromJson(String str) => List<Properties>.from(json.decode(str).map((x) => Properties.fromJson(x)));

String propertiesToJson(List<Properties> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Properties {
    Properties({
        required this.id,
        required this.name,
        required this.type,
        required this.bedRooms,
        required this.bathRooms,
        required this.livingRooms,
        required this.size,
        required this.price,
        required this.fullAddress,
        required this.city,
        required this.state,
        required this.zip,
        required this.description,
        required this.images,
        required this.features,
        required this.propertyMode,
        required this.account,
        required this.date,
        required this.v,
    });

    String id;
    String name;
    String type;
    int bedRooms;
    int bathRooms;
    int livingRooms;
    int size;
    int price;
    String fullAddress;
    String city;
    String state;
    int zip;
    String description;
    List<String> images;
    List<dynamic> features;
    String propertyMode;
    String account;
    DateTime date;
    int v;

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        bedRooms: json["bed_rooms"],
        bathRooms: json["bath_rooms"],
        livingRooms: json["living_rooms"],
        size: json["size"],
        price: json["price"],
        fullAddress: json["full_address"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        features: List<dynamic>.from(json["features"].map((x) => x)),
        propertyMode: json["propertyMode"],
        account: json["account"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "bed_rooms": bedRooms,
        "bath_rooms": bathRooms,
        "living_rooms": livingRooms,
        "size": size,
        "price": price,
        "full_address": fullAddress,
        "city": city,
        "state": state,
        "zip": zip,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x)),
        "propertyMode": propertyMode,
        "account": account,
        "date": date.toIso8601String(),
        "__v": v,
    };
}
