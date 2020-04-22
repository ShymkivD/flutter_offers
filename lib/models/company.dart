import 'package:flutter_offers/models/offer.dart';
import 'package:flutter_offers/models/working_day.dart';

class Company {
  final String id;
  final String title;
  final String type;
  final String color;
  final String image;
  final String description;
  final int rating;
  final int votes;
  final List<String> locations;
  final List<Offer> offers;
  final List<WorkingDay> workingDays;

  Company({
    this.id,
    this.title,
    this.type,
    this.color,
    this.image,
    this.description,
    this.rating,
    this.votes,
    this.locations,
    this.workingDays,
    this.offers,
  });

  factory Company.fromMap(String documentID, Map<String, dynamic> json) =>
      Company(
        id: documentID,
        title: json['title'] ?? '',
        type: json['type'] ?? '',
        color: json['color'] ?? '0xFFFFFFFF',
        image: json['image'] ?? 'assets/images/blank.png',
        description: json['description'] ?? 'No description',
        rating: json['rating'] ?? 0,
        votes: json['votes'] ?? 0,
        locations: List.from(json['locations']) ?? [],
        workingDays: List.from(json['workingSchedule'])
                .map((item) => WorkingDay.fromMap(item))
                .toList() ??
            [],
      );

  Map<String, dynamic> toMap() => {};
}
