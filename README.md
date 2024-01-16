# Android App Checker

## Description

Android App Checker is a Flutter plugin designed to determine the presence of specific installed applications on Android devices. Its main feature is the ability to check for installed apps without requiring the `QUERY_ALL_PACKAGES` permission, enhancing privacy and adhering to Google Play Store's guidelines. Instead, developers specify the apps they wish to check in the Android manifest file.

## Features

- **Privacy-Focused**: Eliminates the need for `QUERY_ALL_PACKAGES` permission.
- **Customizable**: Allows specifying target apps in the Android manifest.
- **Easy Integration**: Simple to integrate into any Flutter project.

## Setup

Add the plugin to your Flutter project's `pubspec.yaml` file:

```yaml
dependencies:
  android_app_checker: ^0.0.1
```

## Configuration

In your Android app's manifest file `AndroidManifest.xml`, add the `<queries>` element to list the applications you want to check:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <queries> 
        <!-- Specify the applications here -->
        <package android:name="com.example.app" />
        <!-- Add more applications as needed -->
    </queries>
</manifest>

```

## Usage

To use the Android App Checker in your Flutter project, follow these steps:

### Importing the Plugin

First, import the plugin in your Dart file:

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:android_app_checker/android_app_checker.dart';
```

### Initializing the Plugin

Create an instance of the plugin for use in your app:

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _androidAppCheckerPlugin = AndroidAppChecker();
  // Rest of the class implementation
}

```

### Checking if a Single Application is Installed

You can check if a specific application is installed by calling isAppInstalled with the package ID:

```dart
Future<void> checkSingleAppInstalled(String packageId) async {
  bool isInstalled;
  try {
    isInstalled = await _androidAppCheckerPlugin.isAppInstalled(packageId); 
  } on PlatformException {
    isInstalled = false;
  }

  setState(() {
    _appStatus = isInstalled ? 'App "$packageId" is installed' : 'App "$packageId" is not installed';
  });
}
```

### Checking if Multiple Applications are Installed

To check the installation status of multiple applications, loop through a list of package IDs:

```dart
Future<void> checkMultipleAppsInstalled(List<String> packageIds) async {
  String status = '';
  for (var packageId in packageIds) {
    bool isInstalled;
    try {
      isInstalled = await _androidAppCheckerPlugin.isAppInstalled(packageId);
    } on PlatformException {
      isInstalled = false;
    }

    status += 'App "$packageId": ${isInstalled ? 'Installed' : 'Not Installed'}\n';
  }

  setState(() {
    _appStatus = status;
  });
}
```

### Implementing the User Interface

In your app's main widget, create buttons or other UI elements to trigger the installation checks:

```dart
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
              onPressed: () => checkMultipleAppsInstalled(['com.example1.app', 'com.example2.app']),
              child: const Text('Check Multiple Apps'),
            ),
          ],
        ),
      ),
    ),
  );
}

```



## Help

If you encounter any issues [please report them here](https://github.com/a-dev-mobile/android_app_checker/issues).

### License

Copyright 2024 AndroidAppChecker

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[android_app_checker]: https://github.com/a-dev-mobile/android_app_checker/