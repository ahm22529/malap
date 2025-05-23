import 'package:dartz/dartz.dart';
import 'package:malab/core/error/fauiler.dart';
import 'package:malab/fetures/auth/domin/entity/user_entity.dart';

abstract class AuthRepo {

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> getUserData();

  Future addUser({required UserEntity userEntity});
}
