import 'package:tailme/domain/core/failures.dart';

class UnexpectedValueError extends Error{
  final ValueFailures valueFailures;

  UnexpectedValueError(this.valueFailures);

  @override
  String toString() {
    const explanation = 'Encountered a value failure at an unrecoverable point. Terminating. ';
  return Error.safeToString('$explanation Failure was: $valueFailures');
  }
}