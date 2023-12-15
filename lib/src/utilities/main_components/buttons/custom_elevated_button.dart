import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:scanxpert/src/constants/view_constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.onPress,
    this.onLongPress,
    this.height,
    this.width,
    this.elevation,
    required this.text,
    this.borderSide,
    this.enabled = true,
    this.shape,
    this.color,
    this.shadowColor,
    this.enableFeedBack,
    this.foreGroundColor,
    this.padding,
    this.iconColor,
    this.iconSize,
    this.alignment,
    this.textStyle,
    this.overlayColor,
  });

  final VoidCallback? onPress;
  final VoidCallback? onLongPress;
  final double? height;
  final double? width;
  final double? elevation;
  final OutlinedBorder? shape;
  final BorderSide? borderSide;
  final bool enabled;
  final Color? color;
  final Color? shadowColor;
  final String text;
  final bool? enableFeedBack;
  final Color? foreGroundColor;
  final EdgeInsets? padding;
  final Color? iconColor;
  final double? iconSize;
  final Alignment? alignment;
  final TextStyle? textStyle;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: enabled ? onPress : null,
      onLongPress: enabled ? onLongPress : null,
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size?>(
          Size(
            width ?? double.infinity,
            height ?? 40.h,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll<Color?>(
          enabled ? color ?? kSecondaryColor : kDisabledColor,
        ),
        elevation: MaterialStatePropertyAll<double?>(
          elevation ?? 15.h,
        ),
        overlayColor: MaterialStatePropertyAll(
          overlayColor ?? kWhiteColor.withOpacity(.1),
        ),
        shadowColor: MaterialStatePropertyAll<Color?>(
          enabled ? shadowColor ?? kSecondaryColor : kDisabledColor,
        ),
        shape: MaterialStatePropertyAll<OutlinedBorder?>(
          shape,
        ),
        side: MaterialStatePropertyAll<BorderSide?>(
          borderSide,
        ),
        enableFeedback: enableFeedBack,
        foregroundColor: MaterialStatePropertyAll<Color?>(
          foreGroundColor,
        ),
        padding: MaterialStatePropertyAll<EdgeInsets?>(padding),
        iconColor: MaterialStatePropertyAll<Color?>(iconColor),
        iconSize: MaterialStatePropertyAll<double?>(iconSize),
        alignment: alignment,
      ),
      child: Text(
        text,
        style: textStyle ??
            context.general.textTheme.labelLarge?.copyWith(
              color: kWhiteColor,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
