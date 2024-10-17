import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/utils/app_text_styles.dart';
import 'package:fruits/core/widgets/custom_password_field.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/not_have_account.dart';
import '../../../../../core/widgets/or_divider.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              onSaved: (value) {
                email = value!;
              },
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomPasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColor.lightPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 33),
            CustomButton(
              text: 'تسجيل الدخول',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context
                      .read<SigninCubit>()
                      .signInWithEmailAndPassword(email, password);
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            const SizedBox(height: 33),
            const NotHaveAccount(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialLoginButton(
              onPressed: () {},
              image: '$imagesPath/google_icon.svg',
              label: 'تسجيل بواسطة جوجل',
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              onPressed: () {},
              image: '$imagesPath/appl_icon.svg',
              label: 'تسجيل بواسطة أبل',
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              onPressed: () {},
              image: '$imagesPath/facebook_icon.svg',
              label: 'تسجيل بواسطة فيسبوك',
            ),
            const SizedBox(height: 16),
          ]),
        ),
      ),
    );
  }
}
