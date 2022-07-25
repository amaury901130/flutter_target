import 'package:flutter/material.dart';
import 'package:rootstrap_target/domain/services/abstract/user_service.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';
import 'package:rootstrap_target/ui/app_status_widget.dart';
import 'package:rootstrap_target/ui/components/primary_button.dart';
import 'package:rootstrap_target/ui/components/secondary_button.dart';
import 'package:rootstrap_target/ui/components/text_field.dart';
import 'package:rootstrap_target/util/service_response.dart';

class SignUpForm extends StatefulWidget {
  final VoidCallback onSignIn;

  const SignUpForm({
    Key? key,
    required this.onSignIn,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpForm();
}

class _SignUpForm extends State<SignUpForm> {
  final _formController = _SignUpFormController();
  var _isLoading = false;

  _SignUpForm();

  void _signUp(BuildContext context) async {
    var isValidForm = _formController.isValidEmail;
    isValidForm = _formController.isValidPasswords && isValidForm;
    isValidForm = _formController.isPasswordsEquals && isValidForm;

    if (isValidForm) {
      await _formController.signUp().then(
        (isSignedUp) {
          //TODO: manage error
          _notifyLoadingState(false);
          if (isSignedUp.data ?? false) {
            Navigator.of(context).pushNamed(AppStatusWidget.route);
          } else {
            _notifyDefaultError(Localize.default_connection_error);
          }
        },
      );
      return;
    }

    _notifyLoadingState(false);
  }

  void _notifyLoadingState(bool isLoading) {
    setState(() {
      _isLoading = isLoading;
    });
  }

  void _notifyDefaultError(Localize error) {
    setState(() {
      _isLoading = false;
      _formController.emailValidator = FieldValidator(
        isMandatory: true,
        hasError: true,
        errorMessage: error,
      );
      _formController.emailValidator.isValid(null);
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
                    isSecure: true,
                    validator: _formController.passwordValidator,
                  ),
                ),
                _textFieldContainer(
                  TextInput(
                    label: Localize.repeat_password_label,
                    controller: _formController.passConfirmTextFieldController,
                    isSecure: true,
                  ),
                ),
                _contentWithPadding(
                  SizedBox(
                    width: Dimen.authButtonWidth,
                    child: PrimaryButton(
                      isLoading: _isLoading,
                      onPressed: () {
                        _notifyLoadingState(true);
                        _signUp(context);
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
                    onPressed: widget.onSignIn,
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
  final _formKey = GlobalKey<FormState>();
  final passTextFieldController = TextEditingController();
  final passConfirmTextFieldController = TextEditingController();

  var passwordValidator = FieldValidator(isMandatory: true);

  GlobalKey<FormState> get formKey => _formKey;

  get _userService => UserService.instance;

  var emailValidator = FieldValidator(isMandatory: true);

  get streamNetworkLoading => _userService.streamNetworkLoading;

  String get emailFieldValue => emailTextFieldController.value.text;

  String get passFieldValue => passTextFieldController.value.text;

  String get passConfirmFieldValue => passConfirmTextFieldController.value.text;

  //TODO: setup gender
  String get genderFieldValue => '';

  bool get isValidPasswords => passwordValidator.isValid(passFieldValue);

  bool get isPasswordsEquals {
    final isPasswordTheSame = passFieldValue == passConfirmFieldValue;
    if (!isPasswordTheSame) {
      passwordValidator = FieldValidator(
        isMandatory: true,
        hasError: true,
        errorMessage: Localize.error_password_equals,
      );
    }
    return isPasswordTheSame;
  }

  static const _validationTime = 500;

  bool get isValidEmail => emailValidator.isValid(passFieldValue);

  void validateForm() {
    Future.delayed(const Duration(milliseconds: _validationTime), () {
      _formKey.currentState?.validate();
    });
  }

  Future<ServiceResponse<bool>> signUp() {
    return _userService.signUp(
      emailFieldValue,
      passFieldValue,
      genderFieldValue,
    );
  }
}
