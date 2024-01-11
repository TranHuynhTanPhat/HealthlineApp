import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../util/translate.dart';
import '../../../resources/export.dart';

class PatientAnimationButton extends StatelessWidget {
  const PatientAnimationButton({
    super.key,
    required this.isPatient,
  });

  final bool isPatient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          width: isPatient == true ? double.maxFinite : 0,
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            height: isPatient == true ? dimensWidth() * 6 : 0,
            width: isPatient == true ? double.maxFinite : 0,
            decoration: BoxDecoration(
              color: isPatient == true
                  ? primary.withOpacity(.2)
                  : transparent,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(dimensWidth()),
                child: const FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: secondary,
                ),
              ),
              Text(
                translate(context, 'patient'),
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(color: secondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
