/// Route paths in one place so screens never hard-code strings.
abstract final class AppRoutes {
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String phone = '/phone';
  static const String otp = '/otp';
  static const String name = '/name';
  static const String dateOfBirth = '/date-of-birth';
  static const String welcome = '/welcome';

  static const String home = '/home';
  static const String rewards = '/rewards';
  static const String explore = '/explore';
  static const String wallet = '/wallet';
  static const String settings = '/settings';

  static const String productPattern = '/product/:id';

  /// Path for the product with [id].
  static String product(String id) => '/product/$id';
}
