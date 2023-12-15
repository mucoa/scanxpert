import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kartal/kartal.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:scanxpert/src/constants/number_constants.dart';
import 'package:scanxpert/src/constants/view_constants.dart';
import 'package:scanxpert/src/features/register/view/components/register_view_mixin.dart';
import 'package:scanxpert/src/utilities/main_components/buttons/custom_elevated_button.dart';
import 'package:scanxpert/src/utilities/main_components/inputs/custom_text_form_field.dart';
import 'package:scanxpert/src/utilities/main_components/keyboard_action/custom_keyboard_action.dart';
import 'package:scanxpert/src/utilities/main_components/svg/svg_adaptive_asset.dart';
import 'package:scanxpert/src/utilities/validator/password_validator.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with RegisterViewMixin {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kTransparentColor,
          elevation: kZero,
          toolbarHeight: 60.h,
        ),
        extendBodyBehindAppBar: true,
        body: KeyboardActions(
          config: CustomKeyboardActions(
                  context: context,
                  nodes: [emailNode, passwordNode, passwordAgainNode])
              .buildSimpleConfig(),
          child: SingleChildScrollView(
            child: Padding(
              padding: context.padding.horizontalNormal,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    context.sized.emptySizedHeightBoxHigh,
                    SvgAdaptiveAsset(
                      preAssetName: 'ic_register',
                      height: 250.h,
                    ),
                    context.sized.emptySizedHeightBoxNormal,
                    Text(
                      '${'register.title'.tr()} 🤝',
                      style: context.general.textTheme.titleMedium,
                    ),
                    context.sized.emptySizedHeightBoxLow3x,
                    CustomMaterialTextFormField(
                      node: emailNode,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      validator: validateEmail,
                      controller: emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      hint: 'register.email'.tr(),
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    CustomMaterialTextFormField(
                      node: passwordNode,
                      controller: passwordController,
                      obscure: true,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      validator: (value) => PasswordValidator(value).validate(),
                      hint: 'register.password'.tr(),
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    CustomMaterialTextFormField(
                      node: passwordAgainNode,
                      controller: passwordAgainController,
                      obscure: true,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      validator: validateAgainPassword,
                      hint: 'register.password-again'.tr(),
                    ),
                    context.sized.emptySizedHeightBoxNormal,
                    CustomElevatedButton(
                      text: 'register.button-text'.tr(),
                      onPress: create,
                    ),
                    context.sized.emptySizedHeightBoxNormal,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
