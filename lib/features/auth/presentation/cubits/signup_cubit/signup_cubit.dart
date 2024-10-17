import 'package:bloc/bloc.dart';

import '../../../domain/repos/auth_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepo authRepo;

  SignupCubit({required this.authRepo}) : super(SignupInitial());

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result =
        await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((failure) {
      emit(SignupFailure(message: failure.message));
    }, (userEntity) {
      emit(SignupSuccess(userEntity: userEntity));
    });
  }
}
