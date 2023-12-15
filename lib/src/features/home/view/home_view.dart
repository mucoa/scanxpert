import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:scanxpert/src/features/home/components/home_view_mixin.dart';
import 'package:scanxpert/src/utilities/main_components/buttons/custom_elevated_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home-title').tr(),
      ),
      body: Center(
        child: CustomElevatedButton(
          text: 'sign-in-button',
          onPress: () => context.go('/sign-in'),
        ),
      ),
    );
  }
}
