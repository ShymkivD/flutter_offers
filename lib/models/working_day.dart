import 'dart:convert';

class WorkingDay {
  final String day;
  final String openingTime;
  final String closingTime;

  WorkingDay(this.day, this.openingTime, this.closingTime);

  factory WorkingDay.fromJson(String str) =>
      WorkingDay.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WorkingDay.fromMap(Map<String, dynamic> json) => WorkingDay(
        json['day'],
        json['openingTime'],
        json['closingTime'],
      );

  Map<String, dynamic> toMap() => {
        'day': day,
        'openingTime': openingTime,
        'closingTime': closingTime,
      };
}
