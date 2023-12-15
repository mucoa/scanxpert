import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scanxpert/src/core/managements/user_handler.dart';
import 'package:scanxpert/src/features/sign_in/view/sign_in_view.dart';

mixin SignInViewMixin on State<SignInView> {
  late final UserHandler _userHandler;
  late final GoogleSignIn _googleSignIn;

  @override
  void initState() {
    super.initState();
    _userHandler = UserHandler();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_userHandler.getUser() != null) {
        context.go('/');
      } else {
        _googleSignIn = GoogleSignIn(
          scopes: [
            'email',
          ],
        );
      }
    });
  }

  // Future<void> _signInWithCredential(AuthCredential credential) async {
  //   try {
  //     await _userHandler.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {}
  // }

  // Future<void> _
}
