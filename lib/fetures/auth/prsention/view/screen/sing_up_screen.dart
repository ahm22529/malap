import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malab/component/custom_button.dart';
import 'package:malab/component/text_builder.dart';
import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_styel.dart';
import 'package:malab/fetures/auth/prsention/manager/sing_up_cuibt/sing_up_cubit.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingUpCubit(),
      child: Scaffold(
        body: BlocConsumer<SingUpCubit, SingUpState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is SingUpLoad) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SingUpFail) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Text(
                        "انشاء حساب",
                        style: AppStyles.f24600(context)
                            .copyWith(color: Colors.black, fontSize: 32),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "يرجى ادخال البيانات المطلوبة لانشاء حسابك",
                        style: AppStyles.f24600(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      const TextFieldBuilder(
                        title: "اسم المستخدم",
                      ),
                      const TextFieldBuilder(
                        title: "رقم الهاتف",
                        isPhone: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          text: "انشاء",
                          onTap: () {
                            context
                                .read<SingUpCubit>()
                                .sendCode(context: context);
                          }),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
