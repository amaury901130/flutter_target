import 'package:flutter/material.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/ui/components/primary_button.dart';
import 'package:rootstrap_target/ui/components/secondary_button.dart';
import 'package:rootstrap_target/ui/components/text_field.dart';

class SignInForm extends StatefulWidget {
  final VoidCallback onSignUp;

  const SignInForm({Key? key, required this.onSignUp}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formController = _SignInFormController();

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
                    validator: FieldValidator(isMandatory: true),
                    isSecure: true,
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
                      text: Localize.signin_label,
                    ),
                  ),
                ),
                _contentWithPadding(
                  SecondaryTextButton(
                    onPressed: () {},
                    text: Localize.forgot_pass_label,
                  ),
                ),
                _contentWithPadding(
                  PrimaryTextButton(
                    onPressed: () {},
                    text: Localize.signin_facebook_label,
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
                    onPressed: widget.onSignUp,
                    text: Localize.signup_label,
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

class _SignInFormController {
  final emailTextFieldController = TextEditingController();
  final passTextFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
}
