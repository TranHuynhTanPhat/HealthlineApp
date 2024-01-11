import 'package:flutter/widgets.dart';

import '../presentation/resources/export.dart';

// String translate(BuildContext context, String? value) {
//   return AppLocalizations.of(context).translate(value.toString());
// }

extension StringExtension on String {
  String translate(BuildContext context) {
    return AppLocalizations.of(context).translate(this);
  }
}

String translate(BuildContext context, String? value){
return AppLocalizations.of(context).translate(value.toString());
}