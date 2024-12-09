import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/global_cubit.dart';
import '../cubit/global_state.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.maxLines,
    this.validator,
    this.obscureText,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.keyboardType,
    this.autofocus,
    this.contentPadding,
    this.hintStyle,
    this.enabled,
    this.borderRadius,
    this.floatingLabelBehavior,
    this.borderColor,
    this.onFieldSubmitted,
    this.onChanged,
    this.filled,
    this.fillColor,
    this.style,
    this.initialValue,
  });
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final bool? filled;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? borderColor;
  final Color? fillColor;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final bool? enabled;
  final double? borderRadius;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalCubit, GlobalState>(
      builder: (context, state) {
        return TextFormField(
          autofocus: autofocus ?? false,
          keyboardType: keyboardType,
          maxLines: maxLines ?? 1,
          validator: validator,
          onChanged: onChanged,
          style: style ?? CustomTextStyle.beiruti400sized14,
          cursorColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.white
              : AppColors.primary,
          obscureText: obscureText ?? false,
          controller: controller,
          initialValue: initialValue,
          enabled: enabled,
          onFieldSubmitted: onFieldSubmitted,
          decoration: InputDecoration(
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            contentPadding: contentPadding ?? EdgeInsets.all(18.w),
            border: getBorderStyle(context, borderRadius, borderColor),
            enabledBorder: getBorderStyle(context, borderRadius, borderColor),
            focusedBorder: getBorderStyle(context, borderRadius, borderColor),
            errorBorder: getBorderStyle(context, borderRadius, borderColor),
            disabledBorder: getBorderStyle(context, borderRadius, borderColor),
            focusedErrorBorder:
                getBorderStyle(context, borderRadius, borderColor),
            errorMaxLines: 5,
            labelText: labelText,
            hintText: hintText,
            fillColor: fillColor,
            filled: filled,
            labelStyle: CustomTextStyle.beiruti700sized14.copyWith(
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.white
                  : AppColors.grey,
            ),
            hintStyle: hintStyle ?? CustomTextStyle.beiruti700sized14,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            suffixIconColor: suffixIconColor ?? AppColors.white,
            prefixIconColor: prefixIconColor ?? AppColors.white,
          ),
        );
      },
    );
  }
}

OutlineInputBorder getBorderStyle(context, borderRadius, borderColor) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 5),
    borderSide: BorderSide(
      color: borderColor ?? AppColors.lightGrey,
      width: 2.w,
    ),
  );
}
