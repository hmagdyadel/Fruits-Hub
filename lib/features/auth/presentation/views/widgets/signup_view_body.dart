import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/const/constants.dart';
import '../../../../../core/helpers/build_error_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_password_field.dart';
import '../../../../../core/widgets/have_account.dart';
import '../../cubits/signup_cubit/signup_cubit.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password, name;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: "full_name".tr(),
                  keyboardType: TextInputType.name),
              const SizedBox(height: 16),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: "email".tr(),
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 16),
              CustomPasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 16),
              TermsAndConditions(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context.read<SignupCubit>().createUserWithEmailAndPassword(email, password, name);
                    } else {
                      buildErrorMessage(context, "accept_terms_and_conditions".tr());
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'create_account'.tr(),
              ),
              const SizedBox(height: 26),
              const HaveAccount(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
