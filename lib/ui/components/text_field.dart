import 'package:flutter/material.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';

class TextInput extends StatelessWidget {
  final Localize? label;
  final Localize? hint;
  final bool isSecure;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final FieldValidator? validator;

  const TextInput({
    Key? key,
    required this.controller,
    this.label,
    this.hint,
    this.isSecure = false,
    this.keyboardType,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        if (label != null)
          Text(
            context.getString(label!).toUpperCase(),
            style: theme.textTheme.subtitle2,
          ),
        Padding(
          padding: EdgeInsets.only(top: spacing.xxs),
          child: TextFormField(
            textAlign: TextAlign.center,
            obscureText: isSecure,
            controller: controller,
            decoration: InputDecoration(
              fillColor: theme.colorScheme.background,
              hintText: (hint != null) ? context.getString(hint!) : null,
            ),
          ),
        ),
        (validator?.hasError ?? false)
            ? Padding(
                padding: EdgeInsets.only(top: spacing.xxs),
                child: Text(
                  context.getString(validator!.errorMessage),
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

class FieldValidator {
  final int? min;
  final int? max;
  final bool isMandatory;
  final String? regex;
  Localize errorMessage;
  bool hasError;

  FieldValidator({
    this.min,
    this.max,
    this.isMandatory = false,
    this.regex,
    this.errorMessage = Localize.empty,
    this.hasError = false,
  });

  bool isValid(String? text) {
    if (hasError) {
      hasError = false;
      return false;
    }

    hasError = true;

    if (isMandatory && (text == null || text.isEmpty)) {
      errorMessage = Localize.error_mandatory_field;
      return false;
    }
    if (errorMessage == Localize.empty ||
        errorMessage == Localize.error_mandatory_field) {
      errorMessage = Localize.error_invalid_field;
    }
    if (min != null && (text == null || text.length < min!)) {
      return false;
    }
    if (max != null && (text == null || text.length > max!)) {
      return false;
    }
    if (regex != null && (text == null || !RegExp(regex!).hasMatch(text))) {
      return false;
    }
    hasError = false;
    return true;
  }
}
