import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malab/component/custom_back_buttom.dart';
import 'package:malab/component/custom_button.dart';
import 'package:malab/component/text_builder.dart';
import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_styel.dart';
import 'package:malab/fetures/auth/prsention/manager/sing_up_cuibt/sing_up_cubit.dart';
import 'package:malab/fetures/auth/prsention/view/widget/trim_and_condtion.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingUpCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomBackButtonWidget(),
          ),
          elevation: 1,
          centerTitle: true,
          title: Text(
            "انشاء حساب",
            style: AppStyles.f19700(context)
                .copyWith(color: Colors.black, fontSize: 22),
          ),
        ),
        body: BlocConsumer<SingUpCubit, SingUpState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is SingUpLoad,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: context.read<SingUpCubit>().globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 15,
                        ),
                        TextFieldBuilder(
                          controller:
                              context.read<SingUpCubit>().nameController,
                          title: "اسم المستخدم",
                        ),
                        TextFieldBuilder(
                          controller:
                              context.read<SingUpCubit>().emailNumberController,
                          title: " البريد الالكتروني",
                        ),
                        TextFieldBuilder(
                          controller:
                              context.read<SingUpCubit>().passwordController,
                          isPassword: true,
                          title: "  كلمه المرور",
                        ),
                        TextFieldBuilder(
                          controller: context
                              .read<SingUpCubit>()
                              .comfrimPasswordController,
                          isPassword: true,
                          title: "  تاكيد كلمه المرور",
                        ),
                        TermsAndConditionsWidget(
                          onChanged: (v) {
                            context.read<SingUpCubit>().isaceept = v ?? false;
                          },
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: "انشاء",
                          onTap: () {
                            context
                                .read<SingUpCubit>()
                                .sendCode(context: context);
                          },
                        ),
                        SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "لديك حساب بالفعل؟",
                              style: AppStyles.f24600(context)
                                  .copyWith(color: Colors.black, fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "تسجيل الدخول",
                                style: AppStyles.f24600(context).copyWith(
                                    color: AppColor.primaryColor, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
