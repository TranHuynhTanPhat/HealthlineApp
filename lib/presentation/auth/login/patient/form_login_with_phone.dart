import 'package:flutter/material.dart';
import 'package:healthline/presentation/resources/string_manager.dart';

import '../../../../util/translate.dart';
import '../../../../util/validate.dart';
import '../../../resources/export.dart';
import '../../../widget/text_field_widget.dart';

class FormLoginWithPhone extends StatefulWidget {
  const FormLoginWithPhone(
      {super.key,
      required this.controllerPhone,
      required this.controllerPassword,
      required this.formKey});
  final TextEditingController controllerPhone;

  final TextEditingController controllerPassword;

  final GlobalKey<FormState> formKey;
  @override
  State<FormLoginWithPhone> createState() => _FormLoginWithPhoneState();
}

class _FormLoginWithPhoneState extends State<FormLoginWithPhone> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: dimensHeight() * 3,
            ),
            child: TextFieldWidget(
              validate: (value) {
                String? error = Validate().validatePhone(context, value!);
                return error;
              },
              controller: widget.controllerPhone,
              prefix: Padding(
                padding: EdgeInsets.only(right: dimensWidth() * .5),
                child: Text(
                  '+84',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              label: StringManager.phone.translate(context),
              textInputType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
        ],
      ),
    );
  }
}
