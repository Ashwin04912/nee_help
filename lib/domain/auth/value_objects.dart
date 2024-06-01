import 'package:dartz/dartz.dart';
import 'package:tailme/domain/core/failures.dart';
import 'package:tailme/domain/core/value_objects.dart';
import 'package:tailme/domain/core/value_validators.dart';

class EmailAddress extends ValueObjects<String> {
  @override
  final Either<ValueFailures<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObjects<String> {
  @override
  final Either<ValueFailures<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  const Password._(this.value);
}

class UserName extends ValueObjects<String> {
  @override
  final Either<ValueFailures<String>, String> value;

  factory UserName(String input) {
    return UserName._(validateUserName(input));
  }

  const UserName._(this.value);
}

