import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_editor/pages/MusicListPage.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

Future<void> askPermissions() async {
  // List of permissions to request
  var permissions = [
    Permission.storage
  ];

  bool granted = true;

  // Loop through permissions
  for (final permission in permissions) {
    // Request and check that permission is granted
    if (!(await permission.request().isGranted)) {
      granted = false;
    }
  }

  // If not all permissions are granted, close app
  if (!granted) {
    SystemNavigator.pop();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    askPermissions();

    return MaterialApp(
      title: 'Music Editor',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MusicListPage(title: 'Music Editor'),
    );
  }
}

