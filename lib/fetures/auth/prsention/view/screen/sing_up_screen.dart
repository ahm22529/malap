import 'package:flutter/material.dart';
import 'package:malab/component/custom_button.dart';
import 'package:malab/component/text_builder.dart';
import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_styel.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
              const TextFieldBuilder(
                title: "كلمه السر",
                isPassword: true,
              ),
              const TextFieldBuilder(
                title: "تاكيد كلمه السر",
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(text: "انشاء", onTap: () {}),
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
                      style: AppStyles.f24600(context)
                          .copyWith(color: AppColor.primaryColor, fontSize: 16),
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
      ),
    );
  }
}
