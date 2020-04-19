import 'dart:convert';

class Offer {
  final String title;
  final String subtitle;
  final String image;

  Offer({this.title, this.subtitle, this.image});

  factory Offer.fromJson(String str) => Offer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        image: json['image'],
        subtitle: json['subtitle'],
        title: json['title'],
      );

  Map<String, dynamic> toMap() => {
        'image': image,
        'subtitle': subtitle,
        'title': title,
      };
}
