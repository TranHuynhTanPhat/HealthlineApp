import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/translate.dart';
import '../../../../util/validate.dart';
import '../../../cubits/export.dart';
import '../../../resources/export.dart';
import '../../../widget/elevated_button_widget.dart';
import '../../../widget/text_field_widget.dart';

class FormEmail extends StatefulWidget {
  const FormEmail(
      {super.key, required this.emailController, required this.isDoctor});
  final TextEditingController emailController;
  final bool isDoctor;

  @override
  State<FormEmail> createState() => _FormEmailState();
}

class _FormEmailState extends State<FormEmail> {
  bool showPassword = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: dimensHeight() * 3),
            child: TextFieldWidget(
              controller: widget.emailController,
              label: translate(context, 'email'),
              hint: 'example@gmail.com',
              validate: (value) => Validate().validateEmail(context, value?.trim()),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButtonWidget(
                text: translate(context, 'send_otp'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthenticationCubit>().sendOTP(
                        email: widget.emailController.text.trim(),
                        isDoctor: widget.isDoctor);
                  }
                }),
          )
        ],
      ),
    );
  }
}
