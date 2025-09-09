import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prodev/app/router_paths.dart';
import 'package:prodev/core/widgets/buttons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> runTest() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16),
        width: double.infinity,

        child: Center(
          child: CustomElevatedButton(
            text: 'Get Started',
            onPressed: () {
              context.pushReplacement(AppPath.crypto.path);
            },
          ),
        ),
      ),
    );
  }
}
