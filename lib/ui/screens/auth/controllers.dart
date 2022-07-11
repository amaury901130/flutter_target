import 'package:flutter/material.dart';

class AuthStateController {
  final pageController = PageController();
  final int signInPagePos = 0;
  final int signUpPagePos = 1;
  final navDuration = const Duration(milliseconds: 500);

  void navToSignIn() => _goToPage(signInPagePos);

  void navToSignUp() => _goToPage(signUpPagePos);

  void _goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: navDuration,
      curve: Curves.easeInOut,
    );
  }
}
