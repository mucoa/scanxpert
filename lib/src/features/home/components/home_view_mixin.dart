import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:scanxpert/src/core/managements/user_handler.dart';
import 'package:scanxpert/src/features/home/view/home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  late final UserHandler _userHandler;

  @override
  void initState() {
    super.initState();
    _userHandler = UserHandler();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final user = _userHandler.getUser();
      if (kDebugMode) Logger().d('user: $user');
      if (user == null) {
        context.go('/sign-in');
      } else if (!user.emailVerified) {
        context.go('/verification');
      }
    });
  }
}