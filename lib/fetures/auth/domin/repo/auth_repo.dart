import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:malab/core/error/fauiler.dart';
import 'package:malab/fetures/auth/domin/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> sendcode(
      BuildContext context, String phoneNumber);
  Future<Either<Failure, UserEntity>> verifyAccount(
      String smsCode, BuildContext context);
}
