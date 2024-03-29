import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util/translate.dart';
import '../cubits/export.dart';
import '../resources/export.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LicenseCubit licenseCubit = LicenseCubit();
    Locale locale = context.read<ResCubit>().state.locale;
    licenseCubit.fetchPolicy(locale.languageCode);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(translate(context, 'privacy_policy')),
      ),
      body: BlocBuilder<LicenseCubit, LicenseState>(
        bloc: licenseCubit,
        builder: (context, state) {
          if (state is PrivacyPolicyState) {
            return ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  vertical: dimensHeight(),
                  horizontal: dimensWidth()*3
                ),
                children: [
                  if (state.policies['value'] != null)
                    Text(
                      state.policies['value']!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                ]);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
