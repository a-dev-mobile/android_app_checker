import 'package:android_app_checker/src/android_app_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Abstract class for the platform interface for AndroidAppChecker.
abstract class AndroidAppCheckerPlatform extends PlatformInterface {
  /// Constructor for AndroidAppCheckerPlatform.
  AndroidAppCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAppCheckerPlatform _instance = MethodChannelAndroidAppChecker();

  /// The default instance of [AndroidAppCheckerPlatform] to use.
  static AndroidAppCheckerPlatform get instance => _instance;

  /// Sets the default instance of [AndroidAppCheckerPlatform].
  static set instance(AndroidAppCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Abstract method to check if an app is installed.
  ///
  /// [packageId] is the unique identifier of the app.
  Future<bool> isAppInstalled(String packageId);
}
