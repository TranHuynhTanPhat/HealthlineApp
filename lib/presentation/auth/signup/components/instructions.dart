import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../../../../util/translate.dart';
import '../../../resources/export.dart';
import '../../../widget/elevated_button_widget.dart';
import '../../../widget/list_tile_widget.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key, required this.onPressed});
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: dimensHeight()),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${translate(context, 'register_an_account_according_to_the_steps')}:',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: color1F1F1F),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: dimensHeight() * 5,
          ),
          child: Column(children: [
            ListTileWidget(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary.withOpacity(.2),
                ),
                child: FaIcon(
                  FontAwesomeIcons.solidUser,
                  size: dimensWidth()*4,
                  color: secondary,
                ),
              ),
              title: Text(
                translate(context, 'profile'),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: secondary),
              ),
              trailing: Text(
                '${translate(context, 'step')} 1',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: color1F1F1F.withOpacity(.3)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: dimensHeight()),
              child: Center(
                  child: LottieBuilder.asset(
                'assets/lotties/arrows-down.json',
                width: dimensWidth()*4,
              )),
            ),
            ListTileWidget(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary.withOpacity(.2),
                ),
                child: FaIcon(
                  FontAwesomeIcons.solidAddressBook,
                  size: dimensWidth()*4,
                  color: secondary,
                ),
              ),
              title: Text(
                translate(context, 'contact'),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: secondary),
              ),
              trailing: Text(
                '${translate(context, 'step')} 2',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: color1F1F1F.withOpacity(.3)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: dimensHeight()),
              child: Center(
                  child: LottieBuilder.asset(
                'assets/lotties/arrows-down.json',
                width: dimensWidth()*4,
              )),
            ),
            ListTileWidget(
              leading: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primary.withOpacity(.2),
                ),
                child: FaIcon(
                  FontAwesomeIcons.key,
                  size: dimensWidth()*4,
                  color: secondary,
                ),
              ),
              title: Text(
                translate(context, 'security'),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: secondary),
              ),
              trailing: Text(
                '${translate(context, 'step')} 3',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: color1F1F1F.withOpacity(.3)),
              ),
            ),
          ]),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButtonWidget(
            text: translate(context, 'start'),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
