import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/domain/core/failures.dart';
import 'package:flutter_ddd/domain/core/value_objects.dart';
import 'package:flutter_ddd/domain/core/value_validators.dart';
import 'package:uuid/uuid.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      value: validateEmailAddress(input),
    );
  }
  const EmailAddress._({
    required this.value,
  });
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      value: validatePassword(input),
    );
  }
  const Password._({
    required this.value,
  });
}

class UniqueId extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(
      value: right(
        const Uuid().v1(),
      ),
    );
  }

  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      value: right(uniqueId),
    );
  }
  const UniqueId._({required this.value});
}
