import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:malab/core/error/custom_exception.dart';
import 'package:malab/core/error/fauiler.dart';
import 'package:malab/core/services/fcm/fcm_services.dart';
import 'package:malab/core/services/fire_base_auth_services/fire_base_aut_ser.dart';
import 'package:malab/core/services/fire_base_storge.dart/fire_base_storage.dart';
import 'package:malab/core/utiles/end_point.dart';
import 'package:malab/fetures/auth/domin/entity/user_entity.dart';
import 'package:malab/fetures/auth/domin/repo/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  FireBaseAutSer fireBaseAutSer = FireBaseAutSer();
  final FireStoreService fireBaseStorage = FireStoreService();

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await fireBaseAutSer.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity =
          UserEntity(name: name, email: email, uId: user.uid, fcmToken: "");
      addUser(userEntity: userEntity);

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

  @override
  Future addUser({required UserEntity userEntity}) async {
    await fireBaseStorage.addData(
        path: EndPoint.addUser, data: userEntity.toMap());
    print("object");
  }

  @override
  Future<Either<Failure, UserEntity>> getUserData() {
    // TODO: implement getUserData
    throw UnimplementedError();
  }
}
