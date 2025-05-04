import 'package:flutter/material.dart';
import 'package:malab/component/custom_image_handler.dart';
import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_styel.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? color;
  final Color? bordereColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final bool isDisabled;
  final String? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius = 15,
    this.backgroundColor = AppColor.primaryColor,
    this.color = Colors.white,
    this.bordereColor = AppColor.primaryColor,
    this.fontSize = 20,
    this.height,
    this.width,
    this.isDisabled = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        height: height ?? 61,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          // color: backgroundColor!,
          color: isDisabled ? AppColor.textInputBorderColor : backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!),
          border: Border.all(
            color: isDisabled ? AppColor.textInputBorderColor : bordereColor!,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: icon != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: AppStyles.f24600(context).copyWith(
                            color: color!,
                            fontSize: fontSize!,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 8),
                      CustomImageHandler(
                        icon,
                        width: 24,
                      ),
                    ],
                  )
                : Text(
                    text,
                    style: AppStyles.f24600(context).copyWith(
                        color: color!,
                        fontSize: fontSize!,
                        fontWeight: FontWeight.w600),
                  ),
          ),
        ),
      ),
    );
  }
}
