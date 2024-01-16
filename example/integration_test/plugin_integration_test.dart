import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:android_app_checker/android_app_checker.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('isAppInstalled test', (WidgetTester tester) async {
    final AndroidAppChecker plugin = AndroidAppChecker();
    final bool isInstalled = await plugin.isAppInstalled('com.example.app');

    expect(isInstalled, isA<bool>());
  });
}
