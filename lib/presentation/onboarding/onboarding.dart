import 'package:flutter/material.dart';
import 'package:healthline/util/translate.dart';

import '../resources/export.dart';
import 'components/exports.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void deactivate() {
    _controller.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(context: context),
            _getPageView(),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p16, vertical: AppPadding.p20),
        alignment: Alignment.center,
        color: transparent,
        height: dimensHeight() * 10,
        width: maxWidth(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentIndex == 0
                ? SizedBox(
                    width: dimensWidth() * 5,
                  )
                : NextButton(currentIndex: _currentIndex, controller: _controller),
            const Spacer(),
            ..._buildDots(_currentIndex, context),
            const Spacer(),
            PreviousButton(currentIndex: _currentIndex, controller: _controller),
          ],
        ),
      ),
    );
  }

  Expanded _getPageView() {
    return Expanded(
      child: PageView.builder(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          itemCount: 6,
          onPageChanged: (value) => setState(() {
                _currentIndex = value;
              }),
          itemBuilder: (BuildContext context, int itemIndex) {
            return SliderWidget(
              fileName: 'img_onboarding_${itemIndex + 1}',
              title: 'ob_title_${itemIndex + 1}'.translate(context),
              description: 'ob_description_${itemIndex + 1}'.translate(context),
            );
          }),
    );
  }

  List<AnimatedContainer> _buildDots(int index, BuildContext context) {
    return List.generate(
      6,
      (index) => AnimatedContainer(
        height: dimensWidth(),
        width: _currentIndex == index ? dimensWidth() * 2 : dimensWidth(),
        margin: const EdgeInsets.only(right: AppMargin.m4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s16),
          color: _currentIndex == index ? primary : colorCDDEFF,
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
      ),
    );
  }
}


