import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference companiesCollection =
      Firestore.instance.collection('brews');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await companiesCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Company> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return Company(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          color: doc.data['sugars'] ?? '0');
    }).toList();
  }

  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        name: snapshot.data['name'],
        sugars: snapshot.data['sugars'],
        strength: snapshot.data['strength']);
  }

  // get brews stream
  Stream<List<Company>> get companies {
    return companiesCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return companiesCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
