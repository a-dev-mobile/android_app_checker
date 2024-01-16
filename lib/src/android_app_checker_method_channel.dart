import 'package:flutter/services.dart';
import 'android_app_checker_platform_interface.dart';

class MethodChannelAndroidAppChecker extends AndroidAppCheckerPlatform {
  final methodChannel = const MethodChannel('android_app_checker');

  @override
  Future<bool> isAppInstalled(String packageId) async {
    final bool? isInstalled = await methodChannel
        .invokeMethod<bool>('isAppInstalled', {'packageId': packageId});
    return isInstalled ?? false;
  }
}
