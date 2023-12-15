import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:scanxpert/src/utilities/main_components/buttons/custom_elevated_button.dart';
import 'package:scanxpert/src/utilities/main_components/svg/svg_adaptive_asset.dart';
import 'package:scanxpert/src/features/sign_in/components/sign_in_card.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({
    super.key,
    required this.onSignInWithGoogle,
    required this.onSignInWithApple,
  });

  final VoidCallback onSignInWithGoogle;
  final VoidCallback onSignInWithApple;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.horizontalLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Flexible(
            child: SvgAdaptiveAsset(preAssetName: 'ic_login'),
          ),
          context.sized.emptySizedHeightBoxLow3x,
          Text(
            'sign-in.title',
            style: context.general.textTheme.titleMedium,
          ).tr(),
          context.sized.emptySizedHeightBoxLow3x,
          SignInCard(
            iconSvgPath: 'assets/svg/ic_google.svg',
            text: 'sign-in.google',
            onTap: onSignInWithGoogle,
          ),
          if (context.device.isIOSDevice) ...[
            context.sized.emptySizedHeightBoxLow,
            ValueListenableBuilder<AdaptiveThemeMode>(
              valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
              builder: (context, value, child) {
                return SignInCard(
                  iconSvgPath: value == AdaptiveThemeMode.dark
                      ? 'assets/svg/ic_apple_light.svg'
                      : 'assets/svg/ic_apple_dark.svg',
                  text: 'sign-in.apple',
                  onTap: onSignInWithApple,
                );
              },
            ),
          ],
          // context.sized.emptySizedHeightBoxLow,
          // SignInCard(
          //   iconSvgPath: 'assets/svg/ic_facebook.svg',
          //   text: 'sign-in-facebook',
          //   onTap: onSignInWithFacebook,
          // ),
          context.sized.emptySizedHeightBoxLow3x,
          Row(
            children: [
              Expanded(child: Divider(thickness: 3.spMin)),
              context.sized.emptySizedWidthBoxLow3x,
              const Text('sign-in.or').tr(),
              context.sized.emptySizedWidthBoxLow3x,
              Expanded(child: Divider(thickness: 3.spMin)),
            ],
          ),
          context.sized.emptySizedHeightBoxLow3x,
          CustomElevatedButton(
            text: 'sign-in.button'.tr(),
            shape: context.border.roundedRectangleAllBorderNormal,
            onPress: () => context.go('/verification'),
          ),
          context.sized.emptySizedHeightBoxLow3x,
          RichText(
            text: TextSpan(
              text: 'sign-in.register'.tr(),
              style: DefaultTextStyle.of(context).style,
              children: [
                WidgetSpan(child: context.sized.emptySizedWidthBoxLow),
                TextSpan(
                  text: 'sign-in.register-link'.tr(),
                  style: context.general.textTheme.headlineMedium,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => context.push('/register'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
