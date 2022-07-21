import 'package:flutter/material.dart';
import 'package:rootstrap_target/resources/locale/localize.dart';
import 'package:rootstrap_target/resources/resources.dart';

class PrimaryButton extends StatelessWidget {
  final Localize text;
  final VoidCallback onPressed;
  final bool isLoading;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimen.primaryButtonHeight,
      child: ElevatedButton(
        onPressed: () => onPressed.call(),
        child: isLoading
            ? SizedBox(
                width: Dimen.loadingSpinnerSize,
                height: Dimen.loadingSpinnerSize,
                child: CircularProgressIndicator(
                  color: Theme.of(context).backgroundColor,
                ),
              )
            : Text(
                context.getString(text).toUpperCase(),
              ),
      ),
    );
  }
}

class PrimaryTextButton extends StatelessWidget {
  final Localize text;
  final VoidCallback onPressed;

  const PrimaryTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimen.primaryButtonHeight,
      child: TextButton(
        onPressed: () => onPressed.call(),
        child: Text(
          context.getString(text),
        ),
      ),
    );
  }
}
