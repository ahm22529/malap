import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malab/component/tost_manager.dart';
import 'package:malab/core/error/custom_exception.dart';

class FireBaseAutSer {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String verificationId = '';
  Future<String> sendCode(
      {required String phoneNumber, required BuildContext context}) async {
    try {
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

      ToastManager.showSuccess(
        context,
        "تم إرسال كود التحقق بنجاح",
      );
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

      ToastManager.showSuccess(
        context,
        "تم التحقق بنجاح",
      );

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

  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'الرقم السري ضعيف جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else if (e.code == "invalid-email") {
        throw CustomException(message: 'البريد الالكتروني غير صحيح.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'تاكد من اتصالك بالانترنت.');
      } else {
        throw CustomException(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");

      throw CustomException(
          message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
