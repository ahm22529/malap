import 'package:flutter/material.dart';

class ToastManager {
  static OverlayEntry? _overlayEntry;

  static void showTopToast(BuildContext context, String message,
      {Color backgroundColor = Colors.green}) {
    _overlayEntry?.remove(); // إزالة أي توست سابق

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).viewPadding.top + 20,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    Future.delayed(const Duration(seconds: 2), () {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  static void showSuccess(BuildContext context, String message) {
    showTopToast(context, message, backgroundColor: Colors.green);
  }

  static void showError(BuildContext context, String message) {
    showTopToast(context, message, backgroundColor: Colors.red);
  }
}
