import 'package:dartz/dartz.dart';
import 'package:tailme/domain/core/failures.dart';


//right --> correct data ..... left --> Failed
Either<ValueFailures<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailures.invalidEmail(failedValue: input));
  }
}


Either<ValueFailures<String>, String> validatePassword(String input) {
  // Maybe not the most robust way of email validation but it's good enough

  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailures.invalidEmail(failedValue: input));
  }
}

Either<ValueFailures<String>, String> validateUserName(String input) {
  // Maybe not the most robust way of email validation but it's good enough

  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailures.invalidEmail(failedValue: input));
  }
}

Either<ValueFailures<String>, String> validateCpassword(String pass,String cpass) {
  // Maybe not the most robust way of email validation but it's good enough

  if (pass == cpass) {
    return right(cpass);
  } else {
    return left(ValueFailures.invalidEmail(failedValue: cpass));
  }
}

