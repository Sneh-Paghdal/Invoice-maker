import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class SaveAndOpenPDF {

  static Future<File> savePDF({
    required String name,
    required Document pdf
}) async {
    final root = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    final file = File('${root!.path}/$name');
    await file.writeAsBytes(await pdf.save());
    debugPrint("${root.path}/$name");
    return file;
  }

  static Future<void> openPDF(File file) async {
    final path = file.path;
    await OpenFile.open(path);
  }

}