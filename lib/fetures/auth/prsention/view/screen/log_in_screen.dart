import 'package:flutter/material.dart';
import 'package:malab/component/custom_button.dart';
import 'package:malab/component/text_builder.dart';
import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_styel.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

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
                " تسجيل الدخول",
                style: AppStyles.f24600(context)
                    .copyWith(color: Colors.black, fontSize: 32),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              const TextFieldBuilder(
                title: "رقم الهاتف",
                isPhone: true,
              ),
              const TextFieldBuilder(
                title: "كلمه السر",
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(text: "تسجيل الدخول ", onTap: () {}),
              SizedBox(
                height: 35,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ليس لديك حساب؟",
                    style: AppStyles.f24600(context)
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "انشاء حساب",
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
