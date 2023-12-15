import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kartal/kartal.dart';
import 'package:logger/logger.dart';
import 'package:scanxpert/src/core/managements/toast_manager.dart';
import 'package:scanxpert/src/core/managements/user_handler.dart';
import 'package:scanxpert/src/features/register/view/register_view.dart';
import 'package:scanxpert/src/utilities/main_components/tools/custom_tools.dart';

mixin RegisterViewMixin on State<RegisterView> {
  late final UserHandler _userHandler;

  late final TextEditingController _passwordController;
  late final TextEditingController _passwordAgainController;
  late final TextEditingController _emailController;

  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;
  late final FocusNode _passwordAgainNode;

  late final GlobalKey<FormState> _formKey;

  TextEditingController get passwordController => _passwordController;
  TextEditingController get passwordAgainController => _passwordAgainController;
  TextEditingController get emailController => _emailController;

  FocusNode get emailNode => _emailNode;
  FocusNode get passwordNode => _passwordNode;
  FocusNode get passwordAgainNode => _passwordAgainNode;

  GlobalKey<FormState> get formKey => _formKey;

  @override
  void initState() {
    super.initState();
    _userHandler = UserHandler();

    _passwordController = TextEditingController();
    _passwordAgainController = TextEditingController();
    _emailController = TextEditingController();

    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    _passwordAgainNode = FocusNode();

    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordAgainController.dispose();
    _emailController.dispose();

    _passwordAgainNode.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();

    _formKey.currentState?.dispose();
  }

  String? validateAgainPassword(String? value) {
    if (value.ext.isNullOrEmpty) {
      return 'validate.text.empty'.tr();
    }
    if (_passwordAgainController.text != _passwordController.text) {
      return 'validate.password.second-password-not-valid'.tr();
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value.ext.isNullOrEmpty) {
      return 'validate.text.empty'.tr();
    }
    if (!value.ext.isValidEmail) {
      return 'validate.text.not-valid-mail'.tr();
    }
    return null;
  }

  void goHome() => context.go('/');

  Future create() async {
    CustomTools.unFocus();
    if (_formKey.currentState?.validate() ?? false) {
      try {
        ToastManager.showCustomLoading();
        await _userHandler.createUserWithEmailAndPassword(
          _emailController.text,
          _passwordController.text,
        );
        ToastManager.cleanAll();
        ToastManager.showCustomText(
          text: 'register.user-created'.tr(),
          type: ToastType.success,
        );
        goHome();
      } on FirebaseAuthException catch (e) {
        ToastManager.cleanAll();
        if (kDebugMode) Logger().e(e);
        ToastManager.showCustomText(
          text: switch (e.code) {
            'weak-password' => 'register.weak-password'.tr(),
            'invalid-email' => 'register.invalid-email'.tr(),
            'email-already-in-use' => 'register.email-already-in-use'.tr(
                namedArgs: {
                  'email': emailController.text,
                },
              ),
            String() => 'simple-error'.tr(
                args: ['register.simple-error'.tr()],
              ),
          },
          type: ToastType.error,
        );
      } catch (e) {
        ToastManager.cleanAll();
        if (kDebugMode) Logger().e(e);
        ToastManager.showCustomText(
          text: 'simple-error'.tr(
            args: ['register.button-text'.tr()],
          ),
          type: ToastType.error,
        );
      }
    }
  }
}
