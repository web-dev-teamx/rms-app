import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';

class Step1 {
  static var formKey;

  Step1({
    required GlobalKey<FormState>? formKey,
    required BuildContext? context,
  });

  CoolStep step1 = CoolStep(
    title: '',
    subtitle: '',
    content: Form(
      key: formKey,
      child: Column(
        children: const [],
      ),
    ),
    validation: () {
      return null;
    },
  );

}
