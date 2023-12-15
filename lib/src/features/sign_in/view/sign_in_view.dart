import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:scanxpert/src/constants/app_constants.dart';
import 'package:scanxpert/src/constants/number_constants.dart';
import 'package:scanxpert/src/constants/view_constants.dart';
import 'package:scanxpert/src/features/sign_in/components/sign_in_body.dart';
import 'package:scanxpert/src/features/sign_in/view/sign_in_view_mixin.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> with SignInViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: SignInBody(
        onSignInWithGoogle: () async {
          // final user = await _googleSignIn.signIn();
          // final gAuth = await user?.authentication;
          // final credential = GoogleAuthProvider.credential(
          //     accessToken: gAuth!.accessToken, idToken: gAuth.idToken);
        },
        onSignInWithApple: () async {
          final credential = await SignInWithApple.getAppleIDCredential(
            scopes: [
              AppleIDAuthorizationScopes.email,
              AppleIDAuthorizationScopes.fullName,
            ],
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kTransparentColor,
      elevation: kZero,
      toolbarHeight: 60.h,
      actions: [
        IconButton(
          onPressed: () async => await EasyLocalization.of(context)?.setLocale(
            EasyLocalization.of(context)?.currentLocale == kALocaleTr
                ? kALocaleEn
                : kALocaleTr,
          ),
          iconSize: 45.h,
          splashRadius: 30.h,
          icon: Text(
            'sign-in.button-text',
            style: context.general.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.spMin,
            ),
          ).tr(),
        ),
        ValueListenableBuilder<AdaptiveThemeMode>(
          valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
          builder: (context, value, child) => Padding(
            padding: context.padding.onlyRightLow,
            child: IconButton(
              onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(
                useSystem: false,
              ),
              icon: Icon(
                AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
                    ? Icons.dark_mode
                    : Icons.light_mode,
                size: 25.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
