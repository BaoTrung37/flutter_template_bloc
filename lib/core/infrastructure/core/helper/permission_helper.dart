import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:example_flutter_app/core/config.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkCameraPermission(BuildContext context) async {
  final status = await Permission.camera.request();
  if (!status.isGranted) {
    if (context.mounted) {
      await showPermissionDialog(context);
    }
    return false;
  } else {
    return true;
  }
}

Future<bool> checkGalleryPermission(BuildContext context) async {
  var isGranted = false;
  if (Platform.isAndroid) {
    final deviceInfo = await DeviceInfoPlugin().androidInfo;
    if (deviceInfo.version.sdkInt > 32) {
      isGranted = !await Permission.photos.request().isGranted;
    } else {
      isGranted = !await Permission.storage.request().isGranted;
    }
  } else {
    final photosStatus = await Permission.photos.request();
    final photosAddOnlyStatus = await Permission.photosAddOnly.request();
    isGranted = !(photosStatus.isGranted || photosAddOnlyStatus.isGranted);
  }

  if (isGranted) {
    if (context.mounted) {
      await showPermissionDialog(context);
    }
    return false;
  } else {
    return true;
  }
}

Future<bool> checkStoragePermission(BuildContext context) async {
  final status = await Permission.storage.request();
  if (!status.isGranted) {
    if (context.mounted) {
      await showPermissionDialog(context);
    }
    return false;
  } else {
    return true;
  }
}

Future<bool> checkMicrophonePermission(BuildContext context) async {
  final status = await Permission.microphone.request();
  if (!status.isGranted) {
    if (context.mounted) {
      await showPermissionDialog(context);
    }

    return false;
  } else {
    return true;
  }
}

Future<bool> checkSpeechPermission(BuildContext context) async {
  final status = await Permission.speech.request();
  if (!status.isGranted) {
    if (context.mounted) {
      await showPermissionDialog(context);
    }

    return false;
  } else {
    return true;
  }
}

Future<bool> showPermissionDialog(BuildContext context) async {
  final result = await showDialog(
    context: context,
    builder: (contextDialog) => Dialog(
      backgroundColor: context.colors.white,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Permission'),
        ],
      ),
    ),
  );
  return result ?? false;
}
