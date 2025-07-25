import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/helpers/build_error_bar.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../domain/repos/auth_repo.dart';
import '../cubits/signup_cubit/signup_cubit.dart';
import '../cubits/signup_cubit/signup_state.dart';

import 'widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        authRepo: getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'new_account'.tr()),
        body: const SignupViewBlocConsumer(),
      ),
    );
  }
}

class SignupViewBlocConsumer extends StatelessWidget {
  const SignupViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(builder: (context, state) {
      return ModalProgressHUD(inAsyncCall: state is SignupLoading ? true : false, child: const SignupViewBody());
    }, listener: (context, state) {
      if (state is SignupSuccess) {
        Navigator.pop(context);
      } else if (state is SignupFailure) {
        buildErrorMessage(context, state.message);
      }
    });
  }
}
