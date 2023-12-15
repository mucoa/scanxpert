import 'package:flutter/material.dart';

class CustomTools {
  static void unFocus() =>
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
}
