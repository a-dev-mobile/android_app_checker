import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:android_app_checker/android_app_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _appStatus = 'Waiting for action...';
  final _androidAppCheckerPlugin = AndroidAppChecker();

  // Check if a single application is installed.
  Future<void> checkSingleAppInstalled(String packageId) async {
    bool isInstalled;
    try {
      isInstalled = await _androidAppCheckerPlugin.isAppInstalled(packageId);
    } on PlatformException {
      isInstalled = false;
    }

    setState(() {
      _appStatus = isInstalled
          ? 'App "$packageId" is installed'
          : 'App "$packageId" is not installed';
    });
  }

  // Check if any application in a list is installed.
  Future<void> checkMultipleAppsInstalled(List<String> packageIds) async {
    String status = '';
    for (var packageId in packageIds) {
      bool isInstalled;
      try {
        isInstalled = await _androidAppCheckerPlugin.isAppInstalled(packageId);
      } on PlatformException {
        isInstalled = false;
      }

      status +=
          'App "$packageId": ${isInstalled ? 'Installed' : 'Not Installed'}\n';
    }

    setState(() {
      _appStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin Example App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_appStatus),
              ElevatedButton(
                onPressed: () => checkSingleAppInstalled('com.example.app'),
                child: const Text('Check Single App'),
              ),
              ElevatedButton(
                onPressed: () => checkMultipleAppsInstalled(
                    ['com.example1.app', 'com.example2.app']),
                child: const Text('Check Multiple Apps'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
