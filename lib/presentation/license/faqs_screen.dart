import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/translate.dart';

import '../cubits/export.dart';
import '../resources/export.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LicenseCubit licenseCubit = LicenseCubit();
    Locale locale = context.read<ResCubit>().state.locale;
    licenseCubit.fetchFAQs(locale.languageCode);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          translate(context, 'FAQs'),
        ),
      ),
      body: BlocBuilder<LicenseCubit, LicenseState>(
        bloc: licenseCubit,
        builder: (context, state) {
          if (state is FAQState) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                vertical: dimensHeight(),
              ),
              children: state.faqs
                  .map(
                    (e) => ExpansionTile(
                      title: Text(
                        e['question']!,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: dimensHeight(),
                              horizontal: dimensWidth() * 3),
                          child: Text(e['answer']!, style: Theme.of(context).textTheme.bodyLarge,),
                        )
                      ],
                    ),
                  )
                  .toList(),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
