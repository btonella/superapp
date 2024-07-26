import 'package:app_core/app_core.dart';
import 'package:app_micro_login/core/core.dart';
import 'package:base_app/modules/modules.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController splashController = I.getDependency<SplashController>();

  @override
  void initState() {
    super.initState();
    splashController.navigateToNextPage(MicroLoginRoutes.login.value);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('splash screen'),
      ),
    );
  }
}
