/// Typed failures returned by repositories instead of thrown exceptions.
sealed class Failure {
  const Failure(this.message);

  final String message;
}

/// No usable connection or the server could not be reached.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No connection']);
}

/// The request took too long.
final class TimeoutFailure extends Failure {
  const TimeoutFailure([super.message = 'Request timed out']);
}

/// The server answered with an error.
final class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode});

  final int? statusCode;
}

/// Local persistence failed.
final class StorageFailure extends Failure {
  const StorageFailure([super.message = 'Storage error']);
}

/// A user-correctable problem such as an unknown phone number.
final class AuthFailure extends Failure {
  const AuthFailure(super.message, {required this.reason});

  final AuthFailureReason reason;
}

enum AuthFailureReason { userNotFound, userAlreadyExists, invalidCode }

extension AuthFailureReasonX on AuthFailureReason {
  bool get isUserNotFound => this == AuthFailureReason.userNotFound;
  bool get isUserAlreadyExists => this == AuthFailureReason.userAlreadyExists;
  bool get isInvalidCode => this == AuthFailureReason.invalidCode;
}

/// Anything unexpected; carries the original error for logging.
final class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Something went wrong', this.cause]);

  final Object? cause;
}
