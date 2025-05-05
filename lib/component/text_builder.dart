import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:malab/component/custom_image_handler.dart';
import 'package:malab/component/custom_text_filed_compont.dart';
import 'package:malab/core/utiles/app_color.dart';
import 'package:malab/core/utiles/app_images.dart';
import 'package:malab/core/utiles/app_styel.dart';

class TextFieldBuilder extends StatefulWidget {
  final String title;
  final bool isPassword;
  final TextInputType keyboardType;
  final bool isPhone;
  final bool isDatePicker;
  final Function(String)? datePickerFunction;
  final TextEditingController? controller;
  final TextEditingController? countryController;
  final Color? bgColor;
  final Color? fillColor;
  final int? maxLines;
  final bool? readOnly;
  final bool? autoFocus;
  final String? Function(String?)? validator;
  final Function(String? value)? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final void Function(String?)? onPressed;
  final String? hintText;

  // المتغيرات المفقودة:
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hasShowPasswordIcon;
  final Color? borderColor;
  final TextStyle? hintTextStyle;

  const TextFieldBuilder({
    super.key,
    required this.title,
    this.isPassword = false,
    this.countryController,
    this.onSubmit,
    this.autoFocus,
    this.keyboardType = TextInputType.text,
    this.isPhone = false,
    this.isDatePicker = false,
    this.maxLines = 1,
    this.controller,
    this.datePickerFunction,
    this.bgColor,
    this.readOnly,
    this.fillColor,
    this.validator,
    this.inputFormatters,
    this.padding,
    this.onPressed,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.hasShowPasswordIcon = false,
    this.borderColor,
    this.hintTextStyle,
  });

  @override
  State<TextFieldBuilder> createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  bool changeObsecureStatus = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: AppStyles.f24600(context).copyWith(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
            const SizedBox(height: 16),
            widget.isPhone
                ? IntlPhoneField(
                    controller: widget.controller,
                    validator: (p0) async {
                      if ((p0?.completeNumber ?? "").isEmpty ||
                          (widget.controller?.text ?? '').isEmpty) {
                        return "يرجى ادخال رقم الهاتف";
                      }
                      return null;
                    },
                    invalidNumberMessage: 'رقم هاتف غير صالح',
                    disableLengthCheck: false,
                    onSubmitted: widget.onSubmit,
                    autofocus: widget.autoFocus ?? false,
                    decoration: InputDecoration(
                      labelStyle:
                          Theme.of(context).inputDecorationTheme.labelStyle,
                      label: widget.label != null && widget.label!.isNotEmpty
                          ? Text(widget.label!)
                          : null,
                      enabled: widget.onPressed == null,
                      suffixIcon: widget.suffixIcon ??
                          (widget.hasShowPasswordIcon
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      changeObsecureStatus =
                                          !changeObsecureStatus;
                                    });
                                  },
                                  icon: CustomImageHandler(
                                    changeObsecureStatus
                                        ? AppImages.eye
                                        : AppImages.eyeOff,
                                    color: const Color.fromARGB(
                                        255, 135, 136, 137),
                                  ),
                                )
                              : null),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: widget.borderColor ?? Colors.grey),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: widget.borderColor ?? Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: widget.borderColor ?? AppColor.primaryColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color: widget.borderColor ?? Colors.grey),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.red.shade700),
                      ),
                      prefixIcon: widget.prefixIcon,
                      filled: true,
                      fillColor: widget.fillColor ?? Colors.white,
                      hintText: widget.hintText,
                      hintStyle: widget.hintTextStyle ??
                          const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.primaryColor.withOpacity(0.03),
                    ),
                    initialCountryCode: 'EG',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    dropdownIconPosition: IconPosition.trailing,
                    pickerDialogStyle: PickerDialogStyle(
                      backgroundColor: Colors.white,
                    ),
                    onCountryChanged: (value) {
                      widget.countryController?.text = value.code;
                    },
                    onChanged: (phone) {
                      widget.controller?.text = phone.number;
                      widget.countryController?.text =
                          phone.countryCode.isEmpty ? '20' : phone.countryCode;
                    },
                  )
                : TextFieldComponent(
                    hint: widget.title,
                    isDatePicker: widget.isDatePicker,
                    validator: widget.validator ??
                        (value) {
                          if (value == null || value.isEmpty) {
                            return "AppStrings";
                          }
                          return null;
                        },
                    inputFormatters: [...?widget.inputFormatters],
                    fillColor: widget.bgColor ?? Colors.white,
                    isReadOnly: widget.readOnly ?? false,
                    keyboardType: widget.keyboardType,
                    maxlines: widget.maxLines,
                    hasShowPasswordIcon: widget.isPassword,
                    controller: widget.controller,
                    hintTextStyle: AppStyles.f24600(context).copyWith(
                        color: AppColor.textLightGreyColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    suffixIcon: widget.isDatePicker
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CustomImageHandler(
                              AppImages.logo,
                            ),
                          )
                        : null,
                    onPress: !widget.isDatePicker
                        ? null
                        : () {
                            showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                            ).then((value) {
                              if (value != null) {
                                widget.controller?.text =
                                    DateFormat('yyyy-MM-dd').format(value);
                              }
                            });
                          },
                  )
          ],
        ),
      ),
    );
  }
}
