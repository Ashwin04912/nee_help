import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
abstract class ValueFailures<T> with _$ValueFailures<T> {
  factory ValueFailures.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailures.shortPassword({required String failedValue}) =
      ShortPassword<T>;

}
