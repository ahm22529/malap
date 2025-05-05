import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:malab/component/tost_manager.dart';
import 'package:malab/fetures/auth/data/repo/auth_repo_imp.dart';
import 'package:malab/fetures/auth/domin/entity/user_entity.dart';
import 'package:malab/fetures/auth/domin/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sing_up_state.dart';

class SingUpCubit extends Cubit<SingUpState> {
  SingUpCubit() : super(SingUpInitial());
  GlobalKey<FormState> globalKey = GlobalKey();
  bool isaceept = false;
  AuthRepo authRepo = AuthRepoImp();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController comfrimPasswordController = TextEditingController();

  void sendCode({required BuildContext context}) async {
    if (globalKey.currentState!.validate()) {
      if (isaceept) {
        emit(SingUpLoad());
        final res = await authRepo.createUserWithEmailAndPassword(
          emailNumberController.text,
          passwordController.text,
          nameController.text,
        );
        res.fold((l) {
          ToastManager.showError(context, l.message);
          emit(SingUpFail(l.message));
        }, (r) => emit(SingUpSucess(user: r)));
      } else {
        ToastManager.showError(context, "يرجى قبول الشروط والاحكام");
      }
    }
  }
}
