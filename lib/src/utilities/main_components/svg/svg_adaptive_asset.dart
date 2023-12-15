import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SvgAdaptiveAsset extends StatelessWidget {
  const SvgAdaptiveAsset({
    super.key,
    required this.preAssetName,
    this.height,
  });

  final String preAssetName;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AdaptiveThemeMode>(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (context, value, child) => SvgPicture.asset(
        'assets/svg/$preAssetName${value == AdaptiveThemeMode.light ? '_dark.svg' : '_light.svg'}',
        height: height ?? 200.h,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('preAssetName', preAssetName));
  }
}
