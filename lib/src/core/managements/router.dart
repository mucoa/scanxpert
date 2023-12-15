import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:scanxpert/src/features/home/view/home_view.dart';
import 'package:scanxpert/src/features/register/view/register_view.dart';
import 'package:scanxpert/src/features/sign_in/view/sign_in_view.dart';
import 'package:scanxpert/src/features/verification/view/verification_view.dart';

enum Routes {
  home,
  signIn,
  register,
  verification;

  Widget getPage(GoRouterState state) => switch (this) {
        Routes.home => const HomeView(),
        Routes.signIn => const SignInView(),
        Routes.register => const RegisterView(),
        Routes.verification => const VerificationView(),
      };
  String get getPath => switch (this) {
        Routes.home => '/',
        Routes.signIn => '/sign-in',
        Routes.register => '/register',
        Routes.verification => '/verification',
      };
}
