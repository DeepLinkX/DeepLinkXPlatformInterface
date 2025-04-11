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
      final testOptions = AndroidIntentOption(
        action: 'android.intent.action.VIEW',
        data: 'https://example.com',
      );
      when(() => mockPlatform.launchIntent(testOptions)).thenAnswer((final _) async {});

      await LauncherUtilPlatform.instance.launchIntent(testOptions);

      verify(() => mockPlatform.launchIntent(testOptions)).called(1);
    });

    test('launchAndroidApp delegates to platform implementation', () async {
      const testPackage = 'com.example.app';
      when(() => mockPlatform.launchAndroidApp(testPackage)).thenAnswer((final _) async {});

      await LauncherUtilPlatform.instance.launchAndroidApp(testPackage);

      verify(() => mockPlatform.launchAndroidApp(testPackage)).called(1);
    });

    test('launchApp delegates to platform implementation', () async {
      const testScheme = 'myapp://';
      when(() => mockPlatform.launchApp(testScheme)).thenAnswer((final _) async {});

      await LauncherUtilPlatform.instance.launchApp(testScheme);

      verify(() => mockPlatform.launchApp(testScheme)).called(1);
    });

    test('isAndroidAppInstalled delegates to platform implementation', () async {
      const testPackage = 'com.example.app';
      when(() => mockPlatform.isAndroidAppInstalled(testPackage)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatform.instance.isAndroidAppInstalled(testPackage);

      verify(() => mockPlatform.isAndroidAppInstalled(testPackage)).called(1);
      expect(result, true);
    });

    test('isAppInstalled delegates to platform implementation', () async {
      const testScheme = 'myapp://';
      when(() => mockPlatform.isAppInstalled(testScheme)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatform.instance.isAppInstalled(testScheme);

      verify(() => mockPlatform.isAppInstalled(testScheme)).called(1);
      expect(result, true);
    });
  });
}
