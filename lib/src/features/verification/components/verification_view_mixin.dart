import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scanxpert/src/core/managements/toast_manager.dart';
import 'package:scanxpert/src/core/managements/user_handler.dart';
import 'package:scanxpert/src/features/verification/view/verification_view.dart';

mixin VerificationViewMixin on State<VerificationView> {
  late final UserHandler _userHandler;
  late Timer _timer;

  final ValueNotifier<String> timerNotifier = ValueNotifier<String>('');

  int timeCounter = 180;

  @override
  void initState() {
    super.initState();
    _userHandler = UserHandler();
  }

  @override
  void dispose() {
    super.dispose();
    _userHandler.disposeUserChange();
  }

  Future<void> sendEmail() async {
    User? user = _userHandler.getUser();
    if (user == null) {
      context.go('/sign-in');
    }
    ToastManager.showCustomLoading();

    await user?.sendEmailVerification();
    timerNotifier.value =
        '${Duration(seconds: timeCounter).inMinutes.toString().padLeft(2, '0')}:${(Duration(seconds: timeCounter).inSeconds % 60).ceil().toString().padLeft(2, '0')}';

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeCounter > 0) {
        timeCounter--;
        timerNotifier.value =
            '${Duration(seconds: timeCounter).inMinutes.toString().padLeft(2, '0')}:${(Duration(seconds: timeCounter).inSeconds % 60).ceil().toString().padLeft(2, '0')}';
      } else {
        _timer.cancel();
        timerNotifier.value = '';
        timeCounter = 180;
      }
    });
    ToastManager.cleanAll();
    ToastManager.showCustomText(
        text: 'verification.send-message'.tr(
          args: [user?.email ?? ''],
        ),
        type: ToastType.success);

    _userHandler.listenUserChanges((user) {
      if (user?.emailVerified ?? false) {
        _userHandler.disposeUserChange();
        context.go('/');
      }
    });
  }
}
