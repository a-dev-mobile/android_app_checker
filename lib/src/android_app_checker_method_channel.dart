import 'package:flutter/services.dart';
import 'android_app_checker_platform_interface.dart';

/// MethodChannelAndroidAppChecker uses MethodChannel to communicate with native code.
class MethodChannelAndroidAppChecker extends AndroidAppCheckerPlatform {
  /// The method channel used to communicate with the native platform.
  final methodChannel = const MethodChannel('android_app_checker');

  /// Checks if an app is installed on the device.
  ///
  /// [packageId] is the unique identifier of the app to be checked.
  /// Returns `true` if the app is installed, `false` otherwise.
  @override
  Future<bool> isAppInstalled(String packageId) async {
    final bool? isInstalled = await methodChannel
        .invokeMethod<bool>('isAppInstalled', {'packageId': packageId});
    return isInstalled ?? false;
  }
}
