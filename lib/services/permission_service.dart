import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();


  Future<bool> requestAllPermissions(BuildContext context) async {
    final permissions = <Permission>[
      Permission.camera,
      Permission.microphone,
      Permission.location,
      Permission.speech,
    ];

    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        permissions.add(Permission.notification);
      }
    }

    final statuses = await permissions.request();
    debugPrint("Permissions Status: $statuses");

    for (final entry in statuses.entries) {
      final permission = entry.key;
      final status = entry.value;

      if (!status.isGranted && context.mounted) {
        await _showPermissionDialog(context, permission);
      }
    }

    if (permissions.contains(Permission.notification)) {
      bool isGranted = await Permission.notification.isGranted;
      print('Notification permission granted: $isGranted');
      return isGranted;
    }


    return true;
  }

  Future<void> _showPermissionDialog(BuildContext context, Permission permission) async {
    final permissionName = _permissionToName(permission);

    if (!context.mounted) return;

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('$permissionName Permission Required'),
        content: const Text(
          'This permission is needed for full functionality. Please enable it from settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  String _permissionToName(Permission permission) {
    switch (permission) {
      case Permission.camera:
        return 'Camera';
      case Permission.microphone:
        return 'Microphone';
      case Permission.location:
      case Permission.locationWhenInUse:
        return 'Location';
      case Permission.speech:
        return 'Speech';
      case Permission.notification:
        return 'Notification';
      default:
        return 'Required';
    }
  }
}
