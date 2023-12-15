import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:scanxpert/src/features/verification/components/verification_view_mixin.dart';
import 'package:scanxpert/src/utilities/main_components/buttons/custom_elevated_button.dart';
import 'package:scanxpert/src/utilities/main_components/svg/svg_adaptive_asset.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView>
    with VerificationViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding.horizontalNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: SvgAdaptiveAsset(
                preAssetName: 'ic_verification',
                height: 250.h,
              ),
            ),
            Text(
              '${'verification.verify-title'.tr()} 💪',
              style: context.general.textTheme.titleMedium,
            ),
            Text(
              'verification.verify-text'.tr(),
              textAlign: TextAlign.center,
              style: context.general.textTheme.bodyLarge,
            ),
            ValueListenableBuilder<String>(
              valueListenable: timerNotifier,
              builder: (context, value, child) => CustomElevatedButton(
                enabled: value.ext.isNullOrEmpty,
                text: value.ext.isNullOrEmpty
                    ? 'verification.verify-button'.tr()
                    : value,
                onPress: sendEmail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
