import 'package:flutter/material.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/ui/components/primary_button.dart';
import 'package:rootstrap_target/ui/components/secondary_button.dart';
import 'package:rootstrap_target/ui/components/text_field.dart';
import 'package:rootstrap_target/ui/screens/auth/controllers.dart';

class SignUpForm extends StatelessWidget {
  final AuthStateController authStateController;
  final _formController = _SignUpFormController();

  SignUpForm({
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
                    validator: FieldValidator(isMandatory: true),
                  ),
                ),
                _textFieldContainer(
                  TextInput(
                    label: Localize.password_label,
                    controller: _formController.passTextFieldController,
                    isSecure: true,
                    validator: FieldValidator(isMandatory: true),
                  ),
                ),
                _textFieldContainer(
                  TextInput(
                    label: Localize.repeat_password_label,
                    controller: _formController.passConfirmTextFieldController,
                    isSecure: true,
                    validator: FieldValidator(isMandatory: true),
                  ),
                ),
                _contentWithPadding(
                  SizedBox(
                    width: Dimen.authButtonWidth,
                    child: PrimaryButton(
                      onPressed: () {
                        if (_formController.formKey.currentState?.validate() ??
                            false) {
                          //TODO: login user
                        }
                      },
                      text: Localize.signup_label,
                    ),
                  ),
                ),
                _contentWithPadding(
                  Container(
                    width: Dimen.authButtonWidth,
                    height: .5,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: spacing.xxxxxl,
                ),
                _contentWithPadding(
                  SecondaryTextButton(
                    onPressed: () => authStateController.navToSignIn(),
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

  Widget _contentWithPadding(
    Widget child, {
    double? padding,
  }) =>
      Padding(
        padding: EdgeInsets.only(top: padding ?? spacing.xl),
        child: child,
      );

  Widget _textFieldContainer(Widget item) {
    return Container(
      width: Dimen.textFieldWidth,
      padding: EdgeInsets.only(top: spacing.xl),
      child: item,
    );
  }
}

class _SignUpFormController {
  final emailTextFieldController = TextEditingController();
  final passTextFieldController = TextEditingController();
  final passConfirmTextFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
