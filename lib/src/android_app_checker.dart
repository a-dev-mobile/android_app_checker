import 'package:android_app_checker/src/android_app_checker_platform_interface.dart';

class AndroidAppChecker {
  Future<bool> isAppInstalled(String packageId) {
    return AndroidAppCheckerPlatform.instance.isAppInstalled(packageId);
  }
}
