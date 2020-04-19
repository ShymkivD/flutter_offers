import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_offers/models/company.dart';
import 'package:flutter_offers/models/company_review.dart';
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
      final list = Company.fromMap(doc.documentID, doc.data);

      print('some data about company: ' + doc.documentID);
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
      'userAvatarURL': user.userAvatarURL
    });
  }

// user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid,
        firstName: snapshot.data['firstName'],
        secondName: snapshot.data['secondName'],
        dateOfBirth: snapshot.data['dateOfBirth'],
        gender: snapshot.data['gender'],
        userAvatarURL: snapshot.data['userAvatarURL']);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  Stream<List<UserData>> reviewsUserData(List<String> uids) {
    if (uids != null) {
      uids.map((i) => print('valuable  data: ' + i));
      return userCollection.snapshots().map((snapshot) => snapshot.documents
              .where((doc) => uids.contains(doc.documentID))
              .map((doc) {
            return UserData(
                uid: doc.documentID,
                firstName: doc.data['firstName'],
                secondName: doc.data['secondName'],
                userAvatarURL: doc.data['userAvatarURL']);
          }).toList());
    }
  }

  List<CompanyReview> _reviewsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((doc) => CompanyReview.fromMap(doc.data))
        .toList();
  }

  Stream<List<CompanyReview>> reviews(String companyID) {
    return companiesCollection
        .document(companyID)
        .collection('reviews')
        .snapshots()
        .map(_reviewsListFromSnapshot);
  }

  Future<void> updateCompanyReview(
      String companyID, int rating, String review) async {
    final CollectionReference reviewsCollection =
        companiesCollection.document(companyID).collection('reviews');
    String userReviewID = await reviewsCollection
        .where('uid', isEqualTo: uid)
        .getDocuments()
        .then((doc) =>
            doc.documents.isNotEmpty ? doc.documents.first.documentID : null);
    if (userReviewID != null) {
      return await reviewsCollection
          .document(userReviewID)
          .updateData({'rating': rating, 'review': review});
    } else {
      return await reviewsCollection
          .add({'uid': uid, 'rating': rating, 'review': review});
    }
  }

  Future<void> deleteCompanyReview(String companyID) async {
    final CollectionReference reviewsCollection =
        companiesCollection.document(companyID).collection('reviews');
    String userReviewID = await reviewsCollection
        .where('uid', isEqualTo: uid)
        .getDocuments()
        .then((doc) =>
            doc.documents.isNotEmpty ? doc.documents.first.documentID : null);
    if (userReviewID != null) {
      return await reviewsCollection.document(userReviewID).delete();
    }
  }
}
