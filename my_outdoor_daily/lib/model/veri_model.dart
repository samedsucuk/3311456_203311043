// To parse this JSON data, do
//
//     final kategori = kategoriFromMap(jsonString);

import 'dart:convert';

List<Kategori> kategoriFromMap(String str) =>
    List<Kategori>.from(json.decode(str).map((x) => Kategori.fromMap(x)));

String kategoriToMap(List<Kategori> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Kategori {
  Kategori({
    required this.kategoriAdi,
    required this.veri,
  });

  final String kategoriAdi;
  final List<Veri> veri;

  factory Kategori.fromMap(Map<String, dynamic> json) => Kategori(
        kategoriAdi: json["kategori_adi"],
        veri: List<Veri>.from(json["veri"].map((x) => Veri.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "kategori_adi": kategoriAdi,
        "veri": List<dynamic>.from(veri.map((x) => x.toMap())),
      };
}

class Veri {
  Veri({
    required this.title,
    required this.text,
    required this.image,
  });

  final String title;
  final String text;
  final String image;

  factory Veri.fromMap(Map<String, dynamic> json) => Veri(
        title: json["title"],
        text: json["text"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "text": text,
        "image": image,
      };
}
