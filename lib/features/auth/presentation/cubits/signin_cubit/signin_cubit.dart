import 'package:bloc/bloc.dart';


import '../../../domain/repos/auth_repo.dart';
import 'signin_state.dart';

class SigninCubit extends Cubit<SignInState> {
  final AuthRepo authRepo;

  SigninCubit({required this.authRepo}) : super(SignInInitial());

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((failure) {
      emit(SignInFailure(message: failure.message));
    }, (userEntity) {
      emit(SignInSuccess(userEntity: userEntity));
    });
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      emit(SignInFailure(message: failure.message));
    }, (userEntity) {
      emit(SignInSuccess(userEntity: userEntity));
    });
  }

  Future<void> signInWithFacebook() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold((failure) {
      emit(SignInFailure(message: failure.message));
    }, (userEntity) {
      emit(SignInSuccess(userEntity: userEntity));
    });
  }

  Future<void> signInWithApple() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithApple();
    result.fold((failure) {
      emit(SignInFailure(message: failure.message));
    }, (userEntity) {
      emit(SignInSuccess(userEntity: userEntity));
    });
  }
}
