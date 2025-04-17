import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform.dart';
import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform_fallback.dart';
import 'package:deeplink_x_platform_interface/src/models/android_intent_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLauncherUtilPlatformInterface extends Mock with MockPlatformInterfaceMixin implements LauncherUtilPlatform {}

void main() {
  late MockLauncherUtilPlatformInterface mockPlatform;

  setUp(() {
    mockPlatform = MockLauncherUtilPlatformInterface();
    LauncherUtilPlatform.instance = mockPlatform;
  });

  test('default implementation is LauncherUtilPlatformInterfaceFallback', () {
    // Reset to default instance
    LauncherUtilPlatform.instance = LauncherUtilPlatformFallback();

    // Verify instance is the fallback implementation
    expect(
      LauncherUtilPlatform.instance,
      isA<LauncherUtilPlatformFallback>(),
    );
  });

  group('LauncherUtilPlatformInterface', () {
    test('launchUrl delegates to platform implementation', () async {
      final testUri = Uri.parse('https://example.com');
      when(() => mockPlatform.launchUrl(testUri)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatform.instance.launchUrl(testUri);

      verify(() => mockPlatform.launchUrl(testUri)).called(1);
      expect(result, true);
    });

    test('launchIntent delegates to platform implementation', () async {
      const testOptions = AndroidIntentOption(
        action: 'android.intent.action.VIEW',
        data: 'https://example.com',
      );
      when(() => mockPlatform.launchIntent(testOptions)).thenAnswer((final _) async {});

      await LauncherUtilPlatform.instance.launchIntent(testOptions);

      verify(() => mockPlatform.launchIntent(testOptions)).called(1);
    });

    test('launchAppByPackageName delegates to platform implementation', () async {
      const testPackage = 'com.example.app';
      when(() => mockPlatform.launchAppByPackageName(testPackage)).thenAnswer((final _) async => true);

      await LauncherUtilPlatform.instance.launchAppByPackageName(testPackage);

      verify(() => mockPlatform.launchAppByPackageName(testPackage)).called(1);
    });

    test('launchAppByScheme delegates to platform implementation', () async {
      const testScheme = 'myapp://';
      when(() => mockPlatform.launchAppByScheme(testScheme)).thenAnswer((final _) async => true);

      await LauncherUtilPlatform.instance.launchAppByScheme(testScheme);

      verify(() => mockPlatform.launchAppByScheme(testScheme)).called(1);
    });

    test('isAppInstalledByPackageName delegates to platform implementation', () async {
      const testPackage = 'com.example.app';
      when(() => mockPlatform.isAppInstalledByPackageName(testPackage)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatform.instance.isAppInstalledByPackageName(testPackage);

      verify(() => mockPlatform.isAppInstalledByPackageName(testPackage)).called(1);
      expect(result, true);
    });

    test('isAppInstalledByScheme delegates to platform implementation', () async {
      const testScheme = 'myapp://';
      when(() => mockPlatform.isAppInstalledByScheme(testScheme)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatform.instance.isAppInstalledByScheme(testScheme);

      verify(() => mockPlatform.isAppInstalledByScheme(testScheme)).called(1);
      expect(result, true);
    });
  });
}
