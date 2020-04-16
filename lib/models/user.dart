import 'dart:io';

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final String firstName;
  final String secondName;
  final String dateOfBirth;
  final String gender;
  final File userAvatar;

  UserData({
    this.uid,
    this.firstName,
    this.secondName,
    this.dateOfBirth,
    this.gender,
    this.userAvatar,
  });
}
