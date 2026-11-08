/// Build-time configuration.
///
/// The app is fully functional without a server. Pass
/// `--dart-define=API_BASE_URL=http://localhost:8080` to refresh from the
/// optional mock server (use `http://10.0.2.2:8080` on the Android emulator).
abstract final class AppConfig {
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');

  static bool get hasRemote => apiBaseUrl.isNotEmpty;
}
