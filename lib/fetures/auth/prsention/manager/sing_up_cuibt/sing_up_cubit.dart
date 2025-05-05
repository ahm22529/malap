import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:malab/fetures/auth/data/repo/auth_repo_imp.dart';
import 'package:malab/fetures/auth/domin/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit() : super(SingUpInitial());
  AuthRepo authRepo = AuthRepoImp();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  void sendCode({required BuildContext context}) async {
    emit(SingUpLoad());
    final res = await authRepo.sendcode(context, "+201025252525");
    res.fold((l) => emit(SingUpFail(l.message)), (r) => emit(SingUpSucess()));
  }
}
