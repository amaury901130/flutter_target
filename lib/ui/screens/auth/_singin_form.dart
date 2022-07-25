import 'package:flutter/material.dart';
import 'package:rootstrap_target/domain/services/abstract/user_service.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/ui/app_status_widget.dart';
import 'package:rootstrap_target/ui/components/primary_button.dart';
import 'package:rootstrap_target/ui/components/secondary_button.dart';
import 'package:rootstrap_target/ui/components/text_field.dart';
import 'package:rootstrap_target/util/service_response.dart';

class SignInForm extends StatefulWidget {
  final VoidCallback onSignUp;

  const SignInForm({Key? key, required this.onSignUp}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInForm();
}

class _SignInForm extends State<SignInForm> {
  final _formController = _SignInFormController();
  bool _isLoading = false;

  Future<void> _signIn(BuildContext context) async {
    _notifyLoadingState(true);
    final isValidEmail = _formController.isValidEmail;
    final isValidPass = _formController.isValidPasswords;

    if (isValidEmail && isValidPass) {
      await _formController.signIn().then(
        (isSignedUp) {
          //TODO: manage error
          if (isSignedUp.data ?? false) {
            Navigator.of(context).pushNamed(AppStatusWidget.route);
          } else {
            _notifyDefaultError();
          }
        },
      ).onError((error, stackTrace) {
        _notifyDefaultError();
      });
      return;
    }

    _notifyDefaultError();
  }

  void _notifyDefaultError() {
    setState(() {
      _isLoading = false;
      _formController.emailValidator = FieldValidator(
        isMandatory: true,
        hasError: true,
        errorMessage: Localize.default_connection_error,
      );
    });
  }

  void _notifyLoadingState(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

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
                    validator: _formController.emailValidator,
                  ),
                ),
                _textFieldContainer(
                  TextInput(
                    label: Localize.password_label,
                    controller: _formController.passTextFieldController,
                    validator: _formController.passValidator,
                    isSecure: true,
                  ),
                ),
                _contentWithPadding(
                  SizedBox(
                    width: Dimen.authButtonWidth,
                    child: PrimaryButton(
                      isLoading: _isLoading,
                      onPressed: () => _signIn(context),
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
  UserService get _userService => UserService.instance;
  final emailTextFieldController = TextEditingController();
  final passTextFieldController = TextEditingController();
  var emailValidator = FieldValidator(isMandatory: true);
  final passValidator = FieldValidator(isMandatory: true);

  String get emailFieldValue => emailTextFieldController.value.text;

  String get passFieldValue => passTextFieldController.value.text;

  bool get isValidPasswords => passValidator.isValid(passFieldValue);

  bool get isValidEmail => emailValidator.isValid(passFieldValue);

  final formKey = GlobalKey<FormState>();

  Future<ServiceResponse<bool>> signIn() async {
    return _userService.signIn(emailFieldValue, passFieldValue);
  }
}
