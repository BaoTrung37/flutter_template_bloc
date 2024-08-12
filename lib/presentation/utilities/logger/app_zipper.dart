import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:flutter/material.dart';

void zipFolder(String sourceDirPath, String zipFilePath) {
  // Create a File to write to
  final encoder = ZipFileEncoder();

  // Encode the directory
  encoder.create(zipFilePath);
  encoder.addDirectory(Directory(sourceDirPath));
  encoder.close();

  debugPrint('Zip file created at $zipFilePath');
}
