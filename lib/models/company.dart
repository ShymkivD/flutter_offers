import 'package:flutter_offers/models/offer.dart';
import 'package:flutter_offers/models/working_day.dart';

class Company {
  final String title;
  final String type;
  final String color;
  final String image;
  final List<Offer> offers;
  final String description;
  final int rating;
  final int votes;
  final List<WorkingDay> workingDays;

  Company({
    this.title,
    this.type,
    this.color,
    this.image,
    this.offers,
    this.description,
    this.rating,
    this.votes,
    this.workingDays,
  });
}
