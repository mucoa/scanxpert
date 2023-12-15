import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

typedef UserChangeCallback = Function(User?);

abstract class IUserHandler {
  User? getUser();
  Future<void> logout();
  Future<UserCredential> signInWithCredential(AuthCredential credential);
  Future<UserCredential> signInWithEmailPassword(String email, String password);
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);
  void listenUserChanges(UserChangeCallback onChange);
  void disposeUserChange();
}

class UserHandler extends IUserHandler {
  late final FirebaseAuth _auth;
  late StreamSubscription<User?>? _userStream;

  UserHandler() {
    _auth = FirebaseAuth.instance;
  }

  @override
  User? getUser() => _auth.currentUser;

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<UserCredential> signInWithCredential(AuthCredential credential) async {
    return await _auth.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  void listenUserChanges(UserChangeCallback onChange) {
    _userStream = _auth.authStateChanges().listen((event) {
      onChange.call(event);
    });
  }

  @override
  void disposeUserChange() {
    _userStream?.cancel();
    _userStream = null;
  }
}
