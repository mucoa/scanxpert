import 'package:easy_localization/easy_localization.dart';
import 'package:kartal/kartal.dart';

abstract class IPasswordValidator {
  String? validate();
}

class PasswordValidator implements IPasswordValidator {
  late final String? password;

  PasswordValidator(this.password);

  @override
  String? validate() {
    if (password.ext.isNullOrEmpty) {
      return 'validate.text.empty'.tr();
    }

    if (!password!.contains(RegExp(r'[a-z]'))) {
      return 'validate.password.lowercase'.tr();
    }

    if (!password!.contains(RegExp(r'[A-Z]'))) {
      return 'validate.password.uppercase'.tr();
    }

    if (!password!.contains(RegExp(r'[0-9]'))) {
      return 'validate.password.numeric'.tr();
    }

    if (!password!.contains(RegExp(r'[`~!@#$%\^&*\(\)_+\\\-={}\[\]\/.,<>;]'))) {
      return 'validate.password.non-alphanumeric'.tr();
    }

    if (password!.length < 8) {
      return 'validate.password.minimum-length'.tr();
    }

    if (password!.length > 4096) {
      return 'validate.password.maximum-length'.tr();
    }

    return null;
  }
}
