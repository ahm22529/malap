part of 'sing_up_cubit.dart';

@immutable
sealed class SingUpState {}

final class SingUpInitial extends SingUpState {}

final class SingUpLoad extends SingUpState {}

final class SingUpSucess extends SingUpState {
  UserEntity user;
  SingUpSucess({required this.user});
}

final class SingUpFail extends SingUpState {
  final String message;
  SingUpFail(this.message);
}
