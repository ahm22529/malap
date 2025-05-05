import 'package:flutter/material.dart';
import 'package:malab/core/utiles/app_color.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        width: 25.0,
        padding: const EdgeInsets.all(2),
        height: 25.0,
        decoration: BoxDecoration(
          color: value ? Colors.white : Colors.white,
          border: Border.all(color: AppColor.bgGray, width: 1.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: value
            ? Container(
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(3)),
                child: const Icon(
                  Icons.done,
                  size: 15,
                  color: Colors.white,
                ),
              )
            : Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3)),
              ),
      ),
    );
  }
}
