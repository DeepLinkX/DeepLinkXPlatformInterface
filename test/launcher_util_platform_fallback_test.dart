import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform_fallback.dart';
import 'package:deeplink_x_platform_interface/src/models/android_intent_option.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LauncherUtilPlatformFallback fallbackImplementation;

  setUp(() {
    fallbackImplementation = LauncherUtilPlatformFallback();
  });

  group('LauncherUtilPlatformInterfaceFallback', () {
    test('launchUrl throws UnimplementedError', () async {
      final testUri = Uri.parse('https://example.com');
      expect(
        () => fallbackImplementation.launchUrl(testUri),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('launchIntent throws UnimplementedError', () async {
      const testOptions = AndroidIntentOption(
        action: 'android.intent.action.VIEW',
        data: 'https://example.com',
      );
      expect(
        () => fallbackImplementation.launchIntent(testOptions),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('launchAppByPackageName throws UnimplementedError', () async {
      const testPackage = 'com.example.app';
      expect(
        () => fallbackImplementation.launchAppByPackageName(testPackage),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('launchAppByScheme throws UnimplementedError', () async {
      const testScheme = 'myapp://';
      expect(
        () => fallbackImplementation.launchAppByScheme(testScheme),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('isAppInstalledByPackageName throws UnimplementedError', () async {
      const testPackage = 'com.example.app';
      expect(
        () => fallbackImplementation.isAppInstalledByPackageName(testPackage),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('isAppInstalledByScheme throws UnimplementedError', () async {
      const testScheme = 'myapp://';
      expect(
        () => fallbackImplementation.isAppInstalledByScheme(testScheme),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
