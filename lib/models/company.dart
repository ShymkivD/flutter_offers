import 'package:flutter_offers/models/offer.dart';

class Company {
  final String title;
  final String type;
  final String color;
  final String image;
  final List<Offer> offers;
  final String description;
  final int rating;
  final int votes;

  Company({
    this.title,
    this.type,
    this.color,
    this.image,
    this.offers,
    this.description,
    this.rating,
    this.votes,
  });
}
