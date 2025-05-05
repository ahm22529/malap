part of 'sing_up_cubit.dart';

@immutable
sealed class SingUpState {}

final class SingUpInitial extends SingUpState {}

final class SingUpLoad extends SingUpState {}

final class SingUpSucess extends SingUpState {
  
}

final class SingUpFail extends SingUpState {
  final String message;
  SingUpFail(this.message);
}
