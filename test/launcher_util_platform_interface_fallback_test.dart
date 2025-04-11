import 'package:deeplink_x_platfrom_interface/src/launcher_util/launcher_util_platform_interface_fallback.dart';
import 'package:deeplink_x_platfrom_interface/src/models/android_intent_option.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LauncherUtilPlatformInterfaceFallback fallbackImplementation;

  setUp(() {
    fallbackImplementation = LauncherUtilPlatformInterfaceFallback();
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
      final testOptions = AndroidIntentOption(
        action: 'android.intent.action.VIEW',
        data: 'https://example.com',
      );
      expect(
        () => fallbackImplementation.launchIntent(testOptions),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('launchAndroidApp throws UnimplementedError', () async {
      const testPackage = 'com.example.app';
      expect(
        () => fallbackImplementation.launchAndroidApp(testPackage),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('launchApp throws UnimplementedError', () async {
      const testScheme = 'myapp://';
      expect(
        () => fallbackImplementation.launchApp(testScheme),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('isAndroidAppInstalled throws UnimplementedError', () async {
      const testPackage = 'com.example.app';
      expect(
        () => fallbackImplementation.isAndroidAppInstalled(testPackage),
        throwsA(isA<UnimplementedError>()),
      );
    });

    test('isAppInstalled throws UnimplementedError', () async {
      const testScheme = 'myapp://';
      expect(
        () => fallbackImplementation.isAppInstalled(testScheme),
        throwsA(isA<UnimplementedError>()),
      );
    });
  });
}
