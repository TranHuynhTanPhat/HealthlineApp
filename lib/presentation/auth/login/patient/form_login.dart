import 'package:flutter/material.dart';
import 'package:healthline/presentation/resources/string_manager.dart';

import '../../../../util/translate.dart';
import '../../../../util/validate.dart';
import '../../../resources/export.dart';
import '../../../widget/text_field_widget.dart';

class FormLoginPatient extends StatefulWidget {
  const FormLoginPatient(
      {super.key,
      required controllerContact,
      required controllerPassword,
      required formKey})
      : _formKey = formKey,
        _controllerContact = controllerContact,
        _controllerPassword = controllerPassword;
  final TextEditingController _controllerContact;

  final TextEditingController _controllerPassword;

  final GlobalKey<FormState> _formKey;
  @override
  State<FormLoginPatient> createState() => _FormLoginPatientState();
}

class _FormLoginPatientState extends State<FormLoginPatient> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: dimensHeight() * 3,
            ),
            child: TextFieldWidget(
              validate: (value) {
                if (Validate().validatePhone(
                        context, widget._controllerContact.text) !=
                    null && num.tryParse(widget._controllerContact.text)==null) {
                  return Validate().validateEmail(context, value);
                } else if (value != null) {
                  return Validate().validatePhone(context, value);
                } else {
                  return null;
                }
              },
              onChanged: (_) => setState(() {}),
              controller: widget._controllerContact,
              hint: StringManager.exEmail.translate(context),
              label: StringManager.emailOrPhone.translate(context),
              textInputType: Validate().validatePhone(
                              context, widget._controllerContact.text) !=
                          null &&
                      num.tryParse(widget._controllerContact.text) == null
                  ? TextInputType.emailAddress
                  : TextInputType.phone,
              prefix: Validate().validatePhone(
                              context, widget._controllerContact.text) ==
                          null ||
                      num.tryParse(widget._controllerContact.text) != null
                  ? Padding(
                      padding: EdgeInsets.only(right: dimensWidth() * .5),
                      child: Text(
                        '+84',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    )
                  : null,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          if (Validate()
                      .validatePhone(context, widget._controllerContact.text) !=
                  null &&
              num.tryParse(widget._controllerContact.text) == null)
            Padding(
              padding: EdgeInsets.only(
                bottom: dimensHeight() * 3,
              ),
              child: TextFieldWidget(
                validate: (value) {
                  try {
                    if (value!.trim().isEmpty) {
                      return StringManager.pleaseEnterPassword
                          .translate(context);
                    }
                    return null;
                  } catch (e) {
                    return StringManager.pleaseEnterPassword.translate(context);
                  }
                },
                controller: widget._controllerPassword,
                label: StringManager.password.translate(context),
                obscureText: !showPassword,
                suffixIcon: IconButton(
                  icon: Icon(showPassword
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded),
                  onPressed: () {
                    setState(
                      () {
                        showPassword = !showPassword;
                      },
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
