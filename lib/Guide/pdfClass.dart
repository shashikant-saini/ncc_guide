import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:nccguide/constants.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

Future<String> prepareTestPdf(context,_documentPath) async {
  final ByteData bytes =
  await DefaultAssetBundle.of(context).load(_documentPath);
  final Uint8List list = bytes.buffer.asUint8List();

  final tempDir = await getTemporaryDirectory();
  final tempDocumentPath = '${tempDir.path}/$_documentPath';

  final file = await File(tempDocumentPath).create(recursive: true);
  file.writeAsBytesSync(list);
  return tempDocumentPath;
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;
  final String barText;

  FullPdfViewerScreen(this.pdfPath, this.barText);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          title: Text(
            barText,
            style: kappBarTS,
          ),
        ),
        path: pdfPath);
  }
}