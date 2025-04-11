import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform_interface.dart';
import 'package:deeplink_x_platform_interface/src/launcher_util/launcher_util_platform_interface_fallback.dart';
import 'package:deeplink_x_platform_interface/src/models/android_intent_option.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLauncherUtilPlatformInterface extends Mock
    with MockPlatformInterfaceMixin
    implements LauncherUtilPlatformInterface {}

void main() {
  late MockLauncherUtilPlatformInterface mockPlatform;

  setUp(() {
    mockPlatform = MockLauncherUtilPlatformInterface();
    LauncherUtilPlatformInterface.instance = mockPlatform;
  });

  test('default implementation is LauncherUtilPlatformInterfaceFallback', () {
    // Reset to default instance
    LauncherUtilPlatformInterface.instance = LauncherUtilPlatformInterfaceFallback();

    // Verify instance is the fallback implementation
    expect(
      LauncherUtilPlatformInterface.instance,
      isA<LauncherUtilPlatformInterfaceFallback>(),
    );
  });

  group('LauncherUtilPlatformInterface', () {
    test('launchUrl delegates to platform implementation', () async {
      final testUri = Uri.parse('https://example.com');
      when(() => mockPlatform.launchUrl(testUri)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatformInterface.instance.launchUrl(testUri);

      verify(() => mockPlatform.launchUrl(testUri)).called(1);
      expect(result, true);
    });

    test('launchIntent delegates to platform implementation', () async {
      final testOptions = AndroidIntentOption(
        action: 'android.intent.action.VIEW',
        data: 'https://example.com',
      );
      when(() => mockPlatform.launchIntent(testOptions)).thenAnswer((final _) async {});

      await LauncherUtilPlatformInterface.instance.launchIntent(testOptions);

      verify(() => mockPlatform.launchIntent(testOptions)).called(1);
    });

    test('launchAndroidApp delegates to platform implementation', () async {
      const testPackage = 'com.example.app';
      when(() => mockPlatform.launchAndroidApp(testPackage)).thenAnswer((final _) async {});

      await LauncherUtilPlatformInterface.instance.launchAndroidApp(testPackage);

      verify(() => mockPlatform.launchAndroidApp(testPackage)).called(1);
    });

    test('launchApp delegates to platform implementation', () async {
      const testScheme = 'myapp://';
      when(() => mockPlatform.launchApp(testScheme)).thenAnswer((final _) async {});

      await LauncherUtilPlatformInterface.instance.launchApp(testScheme);

      verify(() => mockPlatform.launchApp(testScheme)).called(1);
    });

    test('isAndroidAppInstalled delegates to platform implementation', () async {
      const testPackage = 'com.example.app';
      when(() => mockPlatform.isAndroidAppInstalled(testPackage)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatformInterface.instance.isAndroidAppInstalled(testPackage);

      verify(() => mockPlatform.isAndroidAppInstalled(testPackage)).called(1);
      expect(result, true);
    });

    test('isAppInstalled delegates to platform implementation', () async {
      const testScheme = 'myapp://';
      when(() => mockPlatform.isAppInstalled(testScheme)).thenAnswer((final _) async => true);

      final result = await LauncherUtilPlatformInterface.instance.isAppInstalled(testScheme);

      verify(() => mockPlatform.isAppInstalled(testScheme)).called(1);
      expect(result, true);
    });
  });
}
