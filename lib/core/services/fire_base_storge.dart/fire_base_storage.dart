import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:malab/core/error/custom_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseStorage {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> addUser({
    required String fulName,
    required String fcm,
  }) async {
    try {
      await users.add({
        'full_name': fulName,
        'fcm': fcm,
      }).then((value) => print("User Added"));
    } catch (e) {
      print("Failed to add user: $e");
      throw CustomException(message: "حدث خطأ أثناء إضافة المستخدم: $e");
    }
  }

  Future<DocumentSnapshot> getUserData() async {
    try {
      User? currentUser = auth.currentUser; 
      if (currentUser != null) {
        DocumentSnapshot userData =
            await users.doc(currentUser.uid).get(); 
        return userData;
      } else {
        throw CustomException(message: "لم يتم العثور على المستخدم");
      }
    } catch (e) {
      print("Failed to get user data: $e");
      throw CustomException(message: "حدث خطأ أثناء استرجاع البيانات");
    }
  }
}
