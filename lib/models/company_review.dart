import 'dart:convert';

class CompanyReview {
  final String uid;
  final int rating;
  final String review;

  CompanyReview({this.uid, this.rating, this.review});

  factory CompanyReview.fromJson(String str) =>
      CompanyReview.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CompanyReview.fromMap(Map<String, dynamic> json) => CompanyReview(
        uid: json['uid'],
        rating: json['rating'],
        review: json['review'],
      );

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'rating': rating,
        'review': review,
      };
}
