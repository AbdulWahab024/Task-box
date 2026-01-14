
import 'package:flutter/material.dart';
import 'package:task_box/services/firebase_services.dart';
import 'package:task_box/view/login_view.dart';
import "dart:async";

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    SplashServices().isLoggedIn(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/TaskBox.png"),
        ],
      )
    );
  }
}
