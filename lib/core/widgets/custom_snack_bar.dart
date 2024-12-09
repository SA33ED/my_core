import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String message, {
    IconData? icon,
    ToastStates state = ToastStates.success,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 20,
        left: 10,
        right: 10,
        child: Material(
          color: Colors.transparent,
          child: Dismissible(
            key: const ValueKey("dismiss_snackbar"),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              overlayEntry.remove(); // Now overlayEntry is correctly referenced
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: getState(context, state),
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6.0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (icon != null) Icon(icon, color: Colors.white, size: 26),
                  if (icon != null) SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.beiruti500sized16.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Automatically remove after 3 seconds if not swiped
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (overlayEntry.mounted) {
          overlayEntry.remove();
        }
      },
    );
  }
}

void showTwist({
  required BuildContext context,
  required String messege,
  ToastStates? state,
  IconData? icon,
}) {
  CustomSnackbar.show(
    context,
    messege,
    state: state ?? ToastStates.success,
    icon: icon,
  );
}

enum ToastStates {
  error,
  success,
  warning,
}

Color getState(BuildContext context, ToastStates state) {
  switch (state) {
    case ToastStates.error:
      return Colors.red;
    case ToastStates.success:
      return AppColors.primary;
    case ToastStates.warning:
      return Colors.orange;
  }
}
