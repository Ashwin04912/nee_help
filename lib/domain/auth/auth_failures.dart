import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_failures.freezed.dart';

@freezed
abstract class AuthFailures with _$AuthFailures{
  const factory AuthFailures.cancelledByUser() = _CancelledByUser;
  const factory AuthFailures.serverError() = _ServerError;
  const factory AuthFailures.emailAlreadyInUse() = _EmailAlreadyInUse;
  const factory AuthFailures.invalidEmailAndPassCombination() = _InvalidEmailAndPassCombination;
  
}
