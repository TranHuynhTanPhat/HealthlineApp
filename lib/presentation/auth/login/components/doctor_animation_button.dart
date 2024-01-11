import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../util/translate.dart';
import '../../../resources/export.dart';

class DoctorAnimationButton extends StatelessWidget {
  const DoctorAnimationButton({
    super.key,
    required this.isDoctor,
  });

  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.fastLinearToSlowEaseIn,
          width: isDoctor == true ? double.maxFinite : 0,
          alignment: Alignment.center,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            height: isDoctor == true ? dimensWidth() * 6 : 0,
            width: isDoctor == true ? double.maxFinite : 0,
            decoration: BoxDecoration(
              color: isDoctor == true
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
                  FontAwesomeIcons.userDoctor,
                  color: secondary,
                ),
              ),
              Text(
                translate(context, 'doctor'),
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