import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scanxpert/src/constants/number_constants.dart';
import 'package:scanxpert/src/constants/view_constants.dart';

enum ToastType {
  error,
  success,
  information,
  warning;

  Color getColor() => switch (this) {
        ToastType.error => kLightRedColor,
        ToastType.success => kLightGreenColor,
        ToastType.information => kLightBlueTertiaryColor,
        ToastType.warning => kLightOrangeColor,
      };

  IconData getIcon() => switch (this) {
        ToastType.error => Icons.error_outline_rounded,
        ToastType.warning => Icons.warning_amber_rounded,
        ToastType.success => Icons.check_circle_outline_rounded,
        ToastType.information => Icons.info_outline_rounded,
      };
}

class ToastManager {
  static void showCustomLoading() => BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => SizedBox(
          width: 80.h,
          height: 80.h,
          child: Card(
            elevation: kNormalElevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kNormalRadius),
            ),
            child: const SpinKitWaveSpinner(color: kQuaternaryColor),
          ),
        ),
        clickClose: false,
        allowClick: false,
        backButtonBehavior: BackButtonBehavior.ignore,
        ignoreContentClick: true,
      );

  static void cleanAll() => BotToast.cleanAll();

  static void showCustomText({
    required String text,
    required ToastType type,
    Duration? duration,
    Alignment? alignment,
    TextAlign? textAlign,
  }) {
    BotToast.showCustomText(
      toastBuilder: (cancelFunc) => ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 300.h,
          minHeight: 50.h,
        ),
        child: Card(
          color: type.getColor(),
          elevation: kNormalElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kVeryHighRadius),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.spMin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  type.getIcon(),
                  color: kWhiteColor,
                  size: 28.spMin,
                ),
                SizedBox(width: 10.h),
                Flexible(
                  child: SizedBox(
                    child: Text(
                      text,
                      textAlign: textAlign ?? TextAlign.center,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.montserrat(
                        color: kWhiteColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      duration: duration ??
          (type == ToastType.error ? kVeryHighDuration : kHighDuration),
      align: alignment ?? Alignment.bottomCenter,
      backgroundColor: kTransparentColor,
      useSafeArea: true,
      clickClose: true,
      enableKeyboardSafeArea: true,
      ignoreContentClick: false,
    );
  }
}
