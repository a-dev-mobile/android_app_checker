import 'package:android_app_checker/src/android_app_checker_method_channel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelAndroidAppChecker platform = MethodChannelAndroidAppChecker();
  const MethodChannel channel = MethodChannel('android_app_checker');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        if (methodCall.method == 'isAppInstalled') {
          return true;
        }
        return null;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('isAppInstalled', () async {
    expect(await platform.isAppInstalled('com.example.app'), true);
  });
}
