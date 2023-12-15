import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:scanxpert/src/constants/view_constants.dart';

abstract class ICustomKeyboardActions {
  KeyboardActionsConfig buildSimpleConfig();
}

class CustomKeyboardActions extends ICustomKeyboardActions {
  final List<FocusNode> nodes;
  final bool hasNextFocus;
  final BuildContext context;

  CustomKeyboardActions({
    required this.context,
    required this.nodes,
    this.hasNextFocus = false,
  });

  @override
  KeyboardActionsConfig buildSimpleConfig() {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark
          ? kDarkPrimaryColor
          : kLightPrimaryColor,
      nextFocus: hasNextFocus,
      actions: nodes
          .map(
            (e) => KeyboardActionsItem(
              focusNode: e,
              toolbarButtons: [
                (node) {
                  return context.device.isIOSDevice
                      ? TextButton(
                          // padding: context.padding.low,
                          child: Text(
                            'keyboard-done'.tr(),
                          ),
                          onPressed: () => node.unfocus())
                      : TextButton(
                          child: Text(
                            'keyboard-done'.tr(),
                          ),
                          onPressed: () => node.unfocus(),
                        );
                }
              ],
            ),
          )
          .toList(),
    );
  }
}
