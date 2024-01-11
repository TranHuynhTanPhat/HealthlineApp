import 'package:flutter/material.dart';
import 'package:healthline/presentation/resources/string_manager.dart';
import 'package:healthline/util/translate.dart';

import '../../resources/export.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            alignment: Alignment.bottomRight,
            child: TextButton(
              child: Text(
                StringManager.skip.translate(context),
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: color1F1F1F, fontWeight: FontWeight.normal),
              ),
              onPressed: () {
                // Navigator.pushReplacementNamed(context, signUpName);
              },
            ),
          ),
        ),
      ],
    );
  }
}