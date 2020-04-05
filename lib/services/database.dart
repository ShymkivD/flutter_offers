import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference companiesCollection =
      Firestore.instance.collection('companies');

  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await companiesCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  List<Company> _companiesListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      print(doc.data);
      final list = Company(
          title: doc.data['title'] ?? '',
          type: doc.data['type'] ?? 'Company',
          color: doc.data['color'] ?? '0xFFFFFFFF',
          image: doc.data['image'] ?? 'assets/images/blank.png',
          description: doc.data['description'] ?? 'No description',
          rating: doc.data['rating'] ?? 0,
          votes: doc.data['votes'] ?? 0,
          offers: /*List.from(doc.data['offers']) ??*/ []);
      print('some data: ' + list.title);
      return list;
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

  Stream<List<Company>> get companies {
    return companiesCollection.snapshots().map(_companiesListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return companiesCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
