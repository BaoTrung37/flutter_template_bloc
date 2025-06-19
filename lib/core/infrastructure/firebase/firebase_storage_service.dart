import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:example_flutter_app/core/infrastructure/error/api_error.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

typedef OnProgress = void Function(double);

class FirebaseStorageService {
  FirebaseStorageService({
    FirebaseStorage? firebaseStorage,
  }) : _firebaseStorage = firebaseStorage ?? FirebaseStorage.instance;

  final FirebaseStorage _firebaseStorage;

  Future<String> getStorageLocation({
    required String destination,
  }) async {
    final ref = _firebaseStorage.ref(destination);
    return 'gs://${ref.bucket}/${ref.fullPath}';
  }

  Future<String> uploadFileFromPath({
    required String filePath,
    required String destination,
  }) async {
    try {
      final ref = _firebaseStorage.ref(destination);
      await ref.putFile(File(filePath));
      final url = await ref.getDownloadURL();
      return url;
    } catch (error) {
      throw FirebaseException(
        plugin: 'FirebaseStorageService',
        message: error.toString(),
      );
    }
  }

  Future<Either<ServerError, String>> uploadFile({
    required File file,
    required String destination,
    OnProgress? onProgress,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(destination);
      final completer = Completer<Either<ServerError, String>>();

      final uploadTask = ref.putFile(file);
      uploadTask.snapshotEvents.listen((snapshot) async {
        final progress =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        if (snapshot.state == TaskState.success) {
          onProgress?.call(progress);
          final downloadUrl = await snapshot.ref.getDownloadURL();
          completer.complete(right(downloadUrl));
        } else {
          onProgress?.call(progress);
        }
      }).onError((error, stackTrace) {
        completer.completeError(
          left(const ServerError(
              errorCode: ErrorCode.unknown, developerText: 'Unknown error')),
          stackTrace,
        );
        throw FirebaseException(
          plugin: 'FirebaseStorageService',
          message: error.toString(),
        );
      });

      return completer.future;
    } catch (error) {
      return left(const ServerError(
          errorCode: ErrorCode.unknown, developerText: 'Unknown error'));
    }
  }

  Future<bool?> deleteFile({
    required String fileUrl,
  }) async {
    try {
      final ref = _firebaseStorage.refFromURL(fileUrl);
      await ref.delete();
      return true;
    } catch (error) {
      throw FirebaseException(
        plugin: 'FirebaseStorageService',
        message: error.toString(),
      );
    }
  }

  Future<void> downloadFileToLocal({
    required String filePath,
    required String fileName,
    OnProgress? onProgress,
  }) async {
    try {
      final ref = _firebaseStorage.ref(filePath);
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/$fileName');

      final completer = Completer<bool?>();
      final downloadTask = ref.writeToFile(file);

      downloadTask.snapshotEvents.listen(
        (snapshot) async {
          final progress =
              (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
          onProgress?.call(progress);
          if (snapshot.state == TaskState.success) {
            completer.complete(true);
          }
        },
      ).onError((error, stackTrace) {
        completer.completeError(error, stackTrace);
        throw FirebaseException(
          plugin: 'FirebaseStorageService',
          message: error.toString(),
        );
      });

      await completer.future;
    } catch (error) {
      throw FirebaseException(
        plugin: 'FirebaseStorageService',
        message: error.toString(),
      );
    }
  }

  Future<String?> uploadImage({
    required File imageFile,
    required String imagePath,
    OnProgress? onProgress,
  }) async {
    try {
      final ref = _firebaseStorage.ref().child(imagePath);
      final completer = Completer<String?>();

      final uploadTask = ref.putFile(
        imageFile,
        SettableMetadata(
          contentType: 'image/jpeg',
        ),
      );

      uploadTask.snapshotEvents.listen((snapshot) async {
        switch (snapshot.state) {
          case TaskState.running:
            final progress =
                100.0 * (snapshot.bytesTransferred / snapshot.totalBytes);
            onProgress?.call(progress);
            debugPrint('Upload is $progress% complete.');
            break;
          case TaskState.paused:
            debugPrint('Upload is paused.');
            break;
          case TaskState.canceled:
            debugPrint('Upload was canceled');
            break;
          case TaskState.error:
            // Handle unsuccessful uploads
            break;
          case TaskState.success:
            // Handle successful uploads on complete
            // ...
            final downloadUrl = await snapshot.ref.getDownloadURL();
            completer.complete(downloadUrl);
            break;
        }
      }).onError((error, stackTrace) {
        completer.completeError(error, stackTrace);
        throw FirebaseException(
          plugin: 'FirebaseStorageService',
          message: error.toString(),
        );
      });

      return completer.future;
    } catch (error) {
      throw FirebaseException(
        plugin: 'FirebaseStorageService',
        message: error.toString(),
      );
    }
  }
}
