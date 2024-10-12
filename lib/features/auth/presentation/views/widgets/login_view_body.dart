import 'package:flutter/material.dart';
import 'package:fruits/core/utils/app_text_styles.dart';

import '../../../../../core/const/constants.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../../../../core/widgets/not_have_account.dart';
import '../../../../../core/widgets/or_divider.dart';
import 'social_login_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 24),
          const CustomTextFormField(
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
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
            onPressed: () {},
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
    );
  }
}
