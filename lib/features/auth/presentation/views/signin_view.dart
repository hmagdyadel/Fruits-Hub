import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/widgets/custom_progress_hud.dart';
import 'package:fruits/features/auth/presentation/cubits/signin_cubit/signin_state.dart';

import '../../../../core/helpers/build_error_bar.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../on_boarding/presentation/views/on_boarding_screen.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signin_cubit/signin_cubit.dart';
import 'widgets/signin_view_body.dart';

class SigninView extends StatelessWidget {
  static const String routeName = 'loginView';

  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(authRepo: getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
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
    return BlocConsumer<SigninCubit, SignInState>(
        builder: (BuildContext context, SignInState state) {
      return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: const LoginViewBody());
    }, listener: (BuildContext context, SignInState state) {
      if (state is SignInSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, OnBoardingScreen.routeName, (route) => false);
      } else if (state is SignInFailure) {
        buildErrorMessage(context, state.message);
      }
    });
  }
}
