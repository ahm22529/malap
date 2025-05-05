import 'package:dartz/dartz.dart';
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
        phone: user.phoneNumber ?? '',
      );

      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
