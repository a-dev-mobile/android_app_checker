import 'package:android_app_checker/src/android_app_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class AndroidAppCheckerPlatform extends PlatformInterface {
  AndroidAppCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAppCheckerPlatform _instance = MethodChannelAndroidAppChecker();

  static AndroidAppCheckerPlatform get instance => _instance;

  static set instance(AndroidAppCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isAppInstalled(String packageId) {
    throw UnimplementedError('isAppInstalled() has not been implemented.');
  }
}
