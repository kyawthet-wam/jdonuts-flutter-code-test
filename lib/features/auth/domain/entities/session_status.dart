/// Where the app stands on authentication, as the router sees it.
enum SessionStatus {
  /// Still reading the stored session on launch.
  unknown,
  loggedOut,
  loggedIn,
}

extension SessionStatusX on SessionStatus {
  bool get isUnknown => this == SessionStatus.unknown;
  bool get isLoggedOut => this == SessionStatus.loggedOut;
  bool get isLoggedIn => this == SessionStatus.loggedIn;
}
