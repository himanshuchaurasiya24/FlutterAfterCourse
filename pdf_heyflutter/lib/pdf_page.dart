import 'package:flutter/material.dart';
import 'package:pdf_heyflutter/button_widget.dart';
import 'package:pdf_heyflutter/main.dart';
import 'package:pdf_heyflutter/pdf_api.dart';
import 'package:pdf_heyflutter/pdf_paragraph_api.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: 'Simple Pdf',
                onClicked: () async {
                  final pdfFile = await PdfApi.generateCenteredText(
                      'Fisrt Pdf Sample Text.');
                  PdfApi.openFile(file: pdfFile);
                },
              ),
              const SizedBox(
                height: 24,
              ),
              ButtonWidget(
                text: 'Paragraphs Pdf',
                onClicked: () async {
                  final pdfFile = await PdfParagraphApi.generate();
                  PdfApi.openFile(file: pdfFile);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
