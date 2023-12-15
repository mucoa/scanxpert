import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';
import 'package:scanxpert/src/constants/number_constants.dart';
import 'package:scanxpert/src/constants/view_constants.dart';

class SignInCard extends StatelessWidget {
  const SignInCard({
    super.key,
    required this.onTap,
    required this.iconSvgPath,
    required this.text,
  });

  final VoidCallback onTap;
  final String iconSvgPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.r),
        side: BorderSide(
          width: kSecond.spMin,
          color: kHintTextColor,
        ),
      ),
      elevation: kZero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30.h),
        child: Padding(
          padding: context.padding.low,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: SvgPicture.asset(
                  iconSvgPath,
                  height: 30.h,
                ),
              ),
              Expanded(
                flex: 6,
                child: Text(text).tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
