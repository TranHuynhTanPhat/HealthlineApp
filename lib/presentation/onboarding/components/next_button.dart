import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../resources/export.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
    required int currentIndex,
    required PageController controller,
  }) : _currentIndex = currentIndex, _controller = controller;

  final int _currentIndex;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(180),
      child: Container(
        padding: const EdgeInsets.all(AppPadding.p8),
        width: dimensWidth() * 5,
        height: dimensWidth() * 5,
        alignment: Alignment.center,
        child: const FaIcon(
          FontAwesomeIcons.chevronLeft,
          color: primary,
        ),
      ),
      onTap: () {
        if (_currentIndex > 0) {
          // _controller.previousPage(
          //     duration: const Duration(milliseconds: 300),
          //     curve: Curves.fastOutSlowIn);
          _controller.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        }
      },
    );
  }
}
