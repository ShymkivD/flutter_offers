import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/models/user.dart';
import 'package:flutter_offers/models/working_day.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference companiesCollection =
      Firestore.instance.collection('companies');
  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  List<Company> _companiesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      final list = Company(
          title: doc.data['title'] ?? '',
          type: doc.data['type'] ?? '',
          color: doc.data['color'] ?? '0xFFFFFFFF',
          image: doc.data['image'] ?? 'assets/images/blank.png',
          description: doc.data['description'] ?? 'No description',
          rating: doc.data['rating'] ?? 0,
          votes: doc.data['votes'] ?? 0,
          workingDays: List.from(doc.data['workingSchedule'])
                  .map((item) => WorkingDay(
                      item['day'], item['openingTime'], item['closingTime']))
                  .toList() ??
              [],
          offers: /*List.from(doc.data['offers']) ??*/ []);

//      print('some data: ' + list.workingDays[0].day);
      return list;
    }).toList();
  }

  Stream<List<Company>> get companies {
    return companiesCollection.snapshots().map(_companiesListFromSnapshot);
  }

  Future<void> updateUserData(UserData user) async {
    return await userCollection.document(uid).setData({
      'firstName': user.firstName ?? 'user#' + uid.substring(4, 12),
      'secondName': user.secondName ?? '',
      'dateOfBirth': user.dateOfBirth ?? '',
      'gender': user.gender ?? '',
    });
  }

// user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        firstName: snapshot.data['firstName'],
        secondName: snapshot.data['secondName'],
        dateOfBirth: snapshot.data['dateOfBirth'],
        gender: snapshot.data['gender']);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
