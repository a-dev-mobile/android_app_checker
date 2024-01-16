import 'package:android_app_checker/android_app_checker.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidAppCheckerPlatform
    with MockPlatformInterfaceMixin
    implements AndroidAppCheckerPlatform {
  @override
  Future<bool> isAppInstalled(String packageId) => Future.value(true);
  // Предполагаем, что приложение установлено
}

void main() {
  final AndroidAppCheckerPlatform initialPlatform =
      AndroidAppCheckerPlatform.instance;

  test('$MethodChannelAndroidAppChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidAppChecker>());
  });

  test('isAppInstalled', () async {
    AndroidAppChecker androidAppCheckerPlugin = AndroidAppChecker();
    MockAndroidAppCheckerPlatform fakePlatform =
        MockAndroidAppCheckerPlatform();
    AndroidAppCheckerPlatform.instance = fakePlatform;

    expect(
        await androidAppCheckerPlugin.isAppInstalled('com.example.app'), true);
  });
}
