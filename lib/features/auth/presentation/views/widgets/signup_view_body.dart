import 'package:flutter/material.dart';
import 'package:fruits/core/const/constants.dart';
import 'package:fruits/core/widgets/custom_text_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/have_account.dart';
import 'terms_and_conditions.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
                hintText: 'الاسم بالكامل', keyboardType: TextInputType.name),
            const SizedBox(height: 16),
            const CustomTextFormField(
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            const CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: Icon(
                Icons.visibility,
                color: Color(0xFFC9CECF),
              ),
            ),
            const SizedBox(height: 16),
            const TermsAndConditions(),
            const SizedBox(height: 30),
            CustomButton(
              onPressed: () {},
              text: 'إنشاء حساب جديد',
            ),
            const SizedBox(height: 26),
            const HaveAccount(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
