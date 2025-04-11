import 'package:deeplink_x_platfrom_interface/src/launcher_util/launcher_util_platform_interface.dart';
import 'package:deeplink_x_platfrom_interface/src/models/android_intent_option.dart';

/// Fallback implementation that throws `UnimplementedError` or provides a no-op.
/// This prevents crashes on unsupported platforms and ensures a consistent API.
class LauncherUtilPlatformInterfaceFallback extends LauncherUtilPlatformInterface {
  @override
  Future<bool> launchUrl(final Uri uri) async {
    throw UnimplementedError('launchUrl() not implemented on this platform.');
  }

  @override
  Future<void> launchIntent(final AndroidIntentOption options) async {
    throw UnimplementedError('launchIntent() not implemented on this platform.');
  }

  @override
  Future<void> launchAndroidApp(final String packageName) async {
    throw UnimplementedError('launchAndroidApp() not implemented on this platform.');
  }

  @override
  Future<void> launchApp(final String scheme) async {
    throw UnimplementedError('launchApp() not implemented on this platform.');
  }

  @override
  Future<bool> isAndroidAppInstalled(final String packageName) async {
    throw UnimplementedError('isAndroidAppInstalled() not implemented on this platform.');
  }

  @override
  Future<bool> isAppInstalled(final String scheme) async {
    throw UnimplementedError('isAppInstalled() not implemented on this platform.');
  }
}
