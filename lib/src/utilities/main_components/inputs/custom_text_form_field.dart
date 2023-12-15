import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMaterialTextFormField extends StatelessWidget {
  const CustomMaterialTextFormField({
    super.key,
    this.validator,
    required this.hint,
    this.controller,
    this.obscure,
    this.node,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization,
    this.textInputAction,
    this.scrollPadding,
    this.onChange,
    this.autoValidate,
  });
  final String hint;
  final bool? obscure;
  final AutovalidateMode? autoValidate;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;
  final TextInputAction? textInputAction;
  final EdgeInsets? scrollPadding;

  final FocusNode? node;
  final TextEditingController? controller;

  final String? Function(String? value)? validator;
  final Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autovalidateMode: autoValidate,
      controller: controller,
      focusNode: node,
      onChanged: onChange,
      keyboardType: keyboardType,
      scrollPadding: scrollPadding ?? EdgeInsets.only(bottom: 30.h),
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      textInputAction: textInputAction,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
