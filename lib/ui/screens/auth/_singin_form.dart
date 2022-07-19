import 'package:flutter/material.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/ui/components/primary_button.dart';
import 'package:rootstrap_target/ui/components/text_field.dart';
import 'package:rootstrap_target/ui/screens/auth/controllers.dart';

class SignInForm extends StatelessWidget {
  final AuthStateController authStateController;
  final _formController = _SignInFormController();

  SignInForm({
    Key? key,
    required this.authStateController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Form(
          key: _formController.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _textFieldContainer(
                  TextInput(
                    label: Localize.email_label,
                    controller: _formController.emailTextFieldController,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: spacing.l),
                  child: _textFieldContainer(
                    TextInput(
                      label: Localize.password_label,
                      controller: _formController.passTextFieldController,
                      isSecure: true,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: spacing.xl),
                  width: Dimen.authButtonWidth,
                  child: PrimaryButton(
                    onPressed: () {
                      if (_formController.formKey.currentState?.validate() ??
                          false) {
                        //TODO: login user
                      }
                    },
                    text: Localize.signin_label,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldContainer(Widget item) {
    return SizedBox(
      width: Dimen.textFieldWidth,
      child: item,
    );
  }
}

class _SignInFormController {
  final emailTextFieldController = TextEditingController();
  final passTextFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
