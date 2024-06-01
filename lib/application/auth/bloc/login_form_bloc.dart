import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tailme/domain/auth/auth_failures.dart';
import 'package:tailme/domain/auth/i_auth_facade.dart';
import 'package:tailme/domain/auth/value_objects.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';
part 'login_form_bloc.freezed.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthFacade _authFacade;
  LoginFormBloc(this._authFacade) : super(LoginFormState.initial()) {
    on<LoginFormEvent>((event, emit) {
      event.map(
        emailChanged: (value) async {
          emit(state.copyWith(
              email: EmailAddress(value.emailStr),
              authFailureOrSuccessOption: const None()));
        },
        passwordChanged: (value) {
          emit(state.copyWith(
              password: Password(value.passwordStr),
              authFailureOrSuccessOption: const None()));
        },
        registerWithEmailAndPasswordPressed: (value) async* {
          yield* (_performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.registerWithEmailAndPassword as Future<Either<AuthFailures, Unit>> Function({required EmailAddress email, required Password pass}),
          ));
        },
        signInWithEmailAndPasswordPressed:
            (SignInWithEmailAndPasswordPressed value) async* {
          yield* (_performActionOnAuthFacadeWithEmailAndPassword(
            _authFacade.signInWithEmailAndPassword as Future<Either<AuthFailures, Unit>> Function({required EmailAddress email, required Password pass}),
          ));
        },
      );
    });
  }


  Stream<LoginFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Future<Either<AuthFailures, Unit>> Function(
            {required EmailAddress email, required Password pass})
        forwardedCall,
  ) async* {
    Either<AuthFailures, Unit> failureOrSuccess;
    final isEmailValid = state.email.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(
        email: state.email,
        pass: state.password,
      );
      yield state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      );
    }
  }
}
