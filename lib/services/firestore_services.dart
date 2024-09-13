import 'package:e_store_fawad/consts/consts.dart';

class FirestoreServices {
  //Get User Data
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
