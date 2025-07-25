import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helpers/extensions.dart';

import '../../../../core/helpers/build_error_bar.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_progress_hud.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import '../cubits/signin_cubit/signin_state.dart';
import 'widgets/signin_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'login'.tr()),
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SignInState>(builder: (BuildContext context, SignInState state) {
      return CustomProgressHud(
        isLoading: state is SignInLoading ? true : false,
        child: const LoginViewBody(),
      );
    }, listener: (BuildContext context, SignInState state) {
      if (state is SignInSuccess) {
        context.pushNamedAndRemoveUntil(Routes.homeScreen, predicate: false);
      } else if (state is SignInFailure) {
        buildErrorMessage(context, state.message);
      }
    });
  }
}
