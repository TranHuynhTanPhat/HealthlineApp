import 'package:flutter/material.dart';

import '../../util/translate.dart';
import '../resources/export.dart';
import '../resources/images.dart';

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(colorF8F9FD),
            padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                vertical: dimensHeight(), horizontal: dimensWidth()))),
        onPressed: onPressed,
        icon: Image.asset(
          DImages.logoGoogle,
          height: dimensWidth() * 3,
        ),
        label: Text(
          translate(context, 'sign_in_with_google'),
          style: Theme.of(context).textTheme.labelLarge,
        ));
  }
}
