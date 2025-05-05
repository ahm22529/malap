import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malab/component/custom_check_box.dart';

import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_styel.dart';
import 'package:malab/fetures/auth/prsention/manager/sing_up_cuibt/sing_up_cubit.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({
    super.key,
    required this.onChanged,
  });

  final void Function(bool?) onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocProvider(
          create: (context) => SingUpCubit(),
          child: CustomCheckbox(
            onChanged: (v) {
              widget.onChanged(v);
              setState(() {});
            },
            value: context.read<SingUpCubit>().isaceept,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: AppStyles.f13700(context).copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام',
                  style: AppStyles.f13700(context).copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppStyles.f13700(context),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: AppStyles.f13700(context).copyWith(
                    color: AppColor.primaryColor,
                  ),
                ),
                TextSpan(
                  text: ' ',
                  style: AppStyles.f13700(context),
                ),
                TextSpan(
                  text: 'بنا',
                  style: AppStyles.f13700(context)
                      .copyWith(color: AppColor.primaryColor),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}
