import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform_interface_fallback.dart';
import 'package:deeplink_x_platform_interface/src/models/android_intent_option.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// An abstract class that defines the interface for platform-specific
/// implementations of launcher utilities.
///
/// This class extends [PlatformInterface] and provides methods for launching
/// URLs, intents, and apps, as well as checking for app installations.
///
/// Platform-specific implementations should extend this class and provide
/// concrete implementations for the defined methods.
///
/// The default instance of this interface is set to
/// [LauncherUtilPlatformInterfaceFallback], which serves as a fallback
/// implementation for platforms that do not support the required features.
abstract class LauncherUtilPlatformInterface extends PlatformInterface {
  /// Creates an instance of [LauncherUtilPlatformInterface].
  ///
  /// This constructor initializes the platform interface with a unique token
  /// to ensure that only subclasses can be instantiated. It is intended to be
  /// used by platform-specific implementations of the launcher utilities.
  LauncherUtilPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static LauncherUtilPlatformInterface _instance = LauncherUtilPlatformInterfaceFallback();

  /// The default instance of [LauncherUtilPlatformInterface] to use.
  ///
  /// Defaults to [LauncherUtilPlatformInterfaceFallback].
  static LauncherUtilPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LauncherUtilPlatformInterface] when
  /// they register themselves.
  static set instance(final LauncherUtilPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Attempts to launch the given [uri].
  ///
  /// Returns a [Future] that resolves to a boolean indicating whether the
  /// launch was successful.
  Future<bool> launchUrl(final Uri uri);

  /// Launches an Android intent (Android-only).
  ///
  /// This method is a no-op or falls back on other platforms that do not
  /// support intents.
  Future<void> launchIntent(final AndroidIntentOption options);

  /// Launches an app by its package name (Android-only).
  ///
  /// This method is used to open an application directly using its package
  /// name.
  Future<void> launchAndroidApp(final String packageName);

  /// Launches an app using its scheme (e.g., `myapp://`).
  ///
  /// This method is used to open an application using its defined URI scheme.
  Future<void> launchApp(final String scheme);

  /// Checks if an Android app is installed by its package name.
  ///
  /// Returns a [Future] that resolves to a boolean indicating whether the
  /// specified app is installed on the device.
  Future<bool> isAndroidAppInstalled(final String packageName);

  /// Checks if an app that handles a certain scheme is installed.
  ///
  /// Returns a [Future] that resolves to a boolean indicating whether an
  /// app that can handle the specified scheme is installed on the device.
  Future<bool> isAppInstalled(final String scheme);
}
