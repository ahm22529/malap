import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malab/component/tost_manager.dart';
import 'package:malab/core/error/custom_exception.dart';

class FireBaseAutSer {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> sendCode(
      {required String phoneNumber, required BuildContext context}) async {
    try {
      String verificationId = '';

      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {
          auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw CustomException(message: e.message ?? "حدث خطأ أثناء التحقق");
        },
        codeSent: (String id, int? resendToken) {
          verificationId = id;
        },
        codeAutoRetrievalTimeout: (String id) {
          verificationId = id;
        },
      );

      ToastManager.showSuccess(context, "تم إرسال كود التحقق بنجاح", true);
      return verificationId;
    } catch (e) {
      print("خطأ عام أثناء إرسال الكود: $e");
      throw CustomException(message: "حدث خطأ أثناء إرسال الكود");
    }
  }

  Future<User> verifyCode(
      {required String verificationId,
      required String smsCode,
      required BuildContext context}) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      UserCredential userCredential =
          await auth.signInWithCredential(credential);

      ToastManager.showSuccess(context, "تم التحقق بنجاح", true);

      return userCredential.user!;
    } on FirebaseAuthException catch (e) {
      print("خطأ في التحقق من الكود: ${e.message}");
      throw CustomException(
          message: e.message ?? "رمز التحقق غير صحيح أو منتهي");
    } catch (e) {
      print("خطأ عام أثناء تأكيد الكود: $e");
      throw CustomException(message: "حدث خطأ أثناء تأكيد الكود");
    }
  }
}
