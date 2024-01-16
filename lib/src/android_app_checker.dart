import 'package:android_app_checker/src/android_app_checker_platform_interface.dart';

/// Main class for AndroidAppChecker.
class AndroidAppChecker {
  /// Checks if an app is installed on the device.
  ///
  /// [packageId] is the unique identifier of the app to be checked.
  Future<bool> isAppInstalled(String packageId) {
    return AndroidAppCheckerPlatform.instance.isAppInstalled(packageId);
  }
}
