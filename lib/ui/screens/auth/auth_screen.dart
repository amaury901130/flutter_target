import 'package:flutter/material.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/ui/screens/auth/_singin_form.dart';
import 'package:rootstrap_target/ui/screens/auth/_singup_form.dart';
import 'package:rootstrap_target/ui/screens/auth/controllers.dart';

class AuthScreen extends StatelessWidget {
  final _authStateController = AuthStateController();

  AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Images.circle_top.get(fit: BoxFit.fitWidth),
            Padding(
              padding: EdgeInsets.only(top: spacing.xxxxxl),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      context.getString(Localize.app_name),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      pageSnapping: false,
                      controller: _authStateController.pageController,
                      children: [
                        SignInForm(authStateController: _authStateController),
                        SignUpForm(authStateController: _authStateController),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
