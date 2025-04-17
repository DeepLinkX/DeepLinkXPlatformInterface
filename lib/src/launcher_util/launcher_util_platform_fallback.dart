import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform.dart';
import 'package:deeplink_x_platform_interface/src/models/android_intent_option.dart';

/// Fallback implementation that throws `UnimplementedError` or provides a no-op.
/// This prevents crashes on unsupported platforms and ensures a consistent API.
class LauncherUtilPlatformFallback extends LauncherUtilPlatform {
  @override
  Future<bool> launchUrl(final Uri uri) async {
    throw UnimplementedError('launchUrl() not implemented on this platform.');
  }

  @override
  Future<void> launchIntent(final AndroidIntentOption options) async {
    throw UnimplementedError('launchIntent() not implemented on this platform.');
  }

  @override
  Future<bool> launchAppByPackageName(final String packageName) async {
    throw UnimplementedError('launchAppByPackageName() not implemented on this platform.');
  }

  @override
  Future<bool> launchAppByScheme(final String scheme) async {
    throw UnimplementedError('launchAppByScheme() not implemented on this platform.');
  }

  @override
  Future<bool> isAppInstalledByPackageName(final String packageName) async {
    throw UnimplementedError('isAppInstalledByPackageName() not implemented on this platform.');
  }

  @override
  Future<bool> isAppInstalledByScheme(final String scheme) async {
    throw UnimplementedError('isAppInstalledByScheme() not implemented on this platform.');
  }
}
