import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/keyboard.dart';
import '../../../../util/translate.dart';
import '../../../../util/validate.dart';
import '../../../cubits/export.dart';
import '../../../resources/export.dart';
import '../../../resources/string_manager.dart';
import '../../../widget/elevated_button_widget.dart';
import '../../../widget/text_field_widget.dart';
import 'exports.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  late TextEditingController _controllerContact;
  late TextEditingController _controllerPassword;
  final _formKey = GlobalKey<FormState>();
  // bool? errorCheckTermsAndConditions;
  bool remember = false;
  bool isDoctor = false;
  bool isPatient = true;

  String? errorPhone;
  String? errorPassword;

  bool showPassword = false;

  @override
  void initState() {
    _controllerContact = TextEditingController();
    _controllerPassword = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _controllerContact.dispose();
    _controllerPassword.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // check input client's role
        Container(
          margin: EdgeInsets.only(bottom: dimensHeight() * 2),
          height: dimensWidth() * 7.8,
          child: _getRole(context),
        ),
        Form(
          key: _formKey,
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
                  controller: _controllerContact,
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
              Padding(
                padding: EdgeInsets.only(
                  bottom: dimensHeight() * 3,
                ),
                child: TextFieldWidget(
                  validate: (value) {
                    try {
                      if (value!.trim().isEmpty) {
                        return translate(context, 'please_enter_password');
                      }
                      return null;
                    } catch (e) {
                      return translate(context, 'please_enter_password');
                    }
                  },
                  controller: _controllerPassword,
                  label: translate(context, 'password'),
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
        ),
        // FormLoginPatient(
        //     controllerContact: _controllerContact,
        //     controllerPassword: _controllerPassword,
        //     formKey: _formKey),
        // Form(
        //   key: _formKey,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.end,
        //     children: [
        //       Padding(
        //         padding: EdgeInsets.only(
        //           bottom: dimensHeight() * 3,
        //         ),
        //         child: TextFieldWidget(
        //           validate: (value) {
        //             String? error = Validate().validatePhone(context, value!);
        //             return error;
        //           },
        //           controller: _controllerPhone,
        //           prefix: Padding(
        //             padding: EdgeInsets.only(right: dimensWidth() * .5),
        //             child: Text(
        //               '+84',
        //               style: Theme.of(context)
        //                   .textTheme
        //                   .bodyLarge
        //                   ?.copyWith(fontWeight: FontWeight.bold),
        //             ),
        //           ),
        //           label: translate(context, 'phone'),
        //           textInputType: TextInputType.phone,
        //           autovalidateMode: AutovalidateMode.onUserInteraction,
        //         ),
        //       ),
        //       Padding(
        //         padding: EdgeInsets.only(
        //           bottom: dimensHeight() * 3,
        //         ),
        //         child: TextFieldWidget(
        //           validate: (value) {
        //             try {
        //               if (value!.trim().isEmpty) {
        //                 return translate(context, 'please_enter_password');
        //               }
        //               return null;
        //             } catch (e) {
        //               return translate(context, 'please_enter_password');
        //             }
        //           },
        //           controller: _controllerPassword,
        //           label: translate(context, 'password'),
        //           obscureText: !showPassword,
        //           suffixIcon: IconButton(
        //             icon: Icon(showPassword
        //                 ? Icons.visibility_rounded
        //                 : Icons.visibility_off_rounded),
        //             onPressed: () {
        //               setState(
        //                 () {
        //                   showPassword = !showPassword;
        //                 },
        //               );
        //             },
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.only(bottom: dimensHeight() * 3),
          child: _getRemember(context), // check remember client
        ),
        SizedBox(
          width: double.infinity,
          child: LoginButton(
              formKey: _formKey,
              controllerContact: _controllerContact,
              controllerPassword: _controllerPassword,
              isDoctor: isDoctor,
              isPatient: isPatient,
              remember: remember),
        ),
        Container(
          margin: EdgeInsets.only(
            top: dimensHeight() * 2,
          ),
          child: ForgotButton(isDoctor: isDoctor), // forgot password button
        ),
      ],
    );
  }

  Row _getRemember(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          width: 24,
          child: Checkbox(
            side: const BorderSide(width: .5),
            value: remember,
            onChanged: (value) => setState(
              () {
                remember = value!;
              },
            ),
          ),
        ),
        InkWell(
          splashColor: transparent,
          highlightColor: transparent,
          onTap: () => setState(() {
            remember = !remember;
          }),
          child: Text(
            " ${translate(context, 'remember')} ",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Row _getRole(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                // isPatient = isDoctor == false ? true : !isPatient;
                isPatient = true;
                isDoctor = !isPatient;
              });
            },
            splashColor: transparent,
            highlightColor: transparent,
            child: PatientAnimationButton(isPatient: isPatient),
          ),
        ),
        SizedBox(
          width: dimensWidth(),
        ),
        Expanded(
          child: InkWell(
            onTap: () {
              setState(() {
                // isDoctor = isPatient == false ? true : !isDoctor;
                isDoctor = true;
                isPatient = !isDoctor;
              });
            },
            splashColor: transparent,
            highlightColor: transparent,
            child: DoctorAnimationButton(isDoctor: isDoctor),
          ),
        ),
      ],
    );
  }
}

class ForgotButton extends StatelessWidget {
  const ForgotButton({
    super.key,
    required this.isDoctor,
  });

  final bool isDoctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: transparent,
      highlightColor: transparent,
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
        Navigator.pushNamed(context, forgetPasswordRoute, arguments: isDoctor);
      },
      // style: const ButtonStyle(
      //     padding: MaterialStatePropertyAll(EdgeInsets.all(0))),
      child: Text(
        translate(context, 'forgot_your_password'),
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: color6A6E83,
            ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController controllerContact,
    required TextEditingController controllerPassword,
    required this.isDoctor,
    required this.isPatient,
    required this.remember,
  })  : _formKey = formKey,
        _controllerContact = controllerContact,
        _controllerPassword = controllerPassword;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _controllerContact;
  final TextEditingController _controllerPassword;
  final bool isDoctor;
  final bool isPatient;
  final bool remember;

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonWidget(
      text: translate(context, 'log_in'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          KeyboardUtil.hideKeyboard(context);
          context.read<AuthenticationCubit>().signIn(_controllerContact.text,
              password: _controllerPassword.text,
              isDoctor: isDoctor,
              isPatient: isPatient,
              remember: remember);
        }
      },
    );
  }
}
