import 'package:flutter/material.dart';

class AuthStateController {
  final pageController = PageController();
  final int _signInPagePos = 0;
  final int _signUpPagePos = 1;
  final _navDuration = const Duration(milliseconds: 500);

  void navToSignIn() => _goToPage(_signInPagePos);

  void navToSignUp() => _goToPage(_signUpPagePos);

  void _goToPage(int page) {
    pageController.animateToPage(
      page,
      duration: _navDuration,
      curve: Curves.easeInOut,
    );
  }
}
