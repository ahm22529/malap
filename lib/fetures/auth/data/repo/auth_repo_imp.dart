import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:malab/core/error/custom_exception.dart';
import 'package:malab/core/error/fauiler.dart';
import 'package:malab/core/services/fire_base_auth_services/fire_base_aut_ser.dart';
import 'package:malab/fetures/auth/domin/entity/user_entity.dart';
import 'package:malab/fetures/auth/domin/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  FireBaseAutSer fireBaseAutSer = FireBaseAutSer();
  @override
  Future<Either<Failure, String>> sendcode(
      BuildContext context, String phoneNumber) async {
    try {
      var res = await fireBaseAutSer.sendCode(
          phoneNumber: phoneNumber, context: context);
      return right(res);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyAccount(
      String smsCode, BuildContext context) async {
    try {
      final user = await fireBaseAutSer.verifyCode(
        verificationId: fireBaseAutSer.verificationId,
        smsCode: smsCode,
        context: context,
      );

      final userEntity = UserEntity(
        uId: user.uid,
        name: user.displayName ?? '',
        email: user.phoneNumber ?? '',
      );

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await fireBaseAutSer.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(
        name: name,
        email: email,
        uId: user.uid,
      );

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await fireBaseAutSer.signInWithEmailAndPassword(
          email: email, password: password);

      return right(UserEntity(
          name: user.displayName ?? '', email: email, uId: user.uid));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}',
      );
      return left(
        ServerFailure(
          'حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
        ),
      );
    }
  }
}
