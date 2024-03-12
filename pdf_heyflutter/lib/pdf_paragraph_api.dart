import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:pdf_heyflutter/pdf_api.dart';

class PdfParagraphApi {
  static Future<File> generate() async {
    final pdf = Document();
    pdf.addPage(
      MultiPage(
        build: (context) {
          return <Widget>[
            buildCustomHeader(),
            Header(
              child: Text('My Headline'),
            ),
            buildCustomHeadline(),
            buildLink(),
            ...buildBulletPoints(),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
            Paragraph(
              text: LoremText().paragraph(60),
            ),
          ];
        },
        footer: (context) {
          final text = 'Page ${context.pageNumber} of ${context.pagesCount}';
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                text,
                textAlign: TextAlign.end,
              ),
            ],
          );
        },
      ),
    );
    return PdfApi.saveDocument(name: 'first_pdf_paragraph.pdf', pdf: pdf);
  }

  static List<Widget> buildBulletPoints() {
    return [
      Bullet(
        text: 'Fisrt Bullet',
      ),
      Bullet(
        text: 'Second Bullet',
      ),
      Bullet(
        text: 'Third Bullet',
      ),
    ];
  }

  static Widget buildLink() {
    return UrlLink(
      child: Text(
        'Go to',
        style: TextStyle(
          color: PdfColor.fromRYB(
            0,
            0,
            1.0,
          ),
          decoration: TextDecoration.underline,
        ),
      ),
      destination: 'https://instagram.com/_hc24',
    );
  }

  static Widget buildCustomHeadline() {
    return Header(
        child: Text(
          'My Second Headline',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: PdfColors.white,
          ),
        ),
        decoration: const BoxDecoration(
          color: PdfColors.red,
        ));
  }

  static Widget buildCustomHeader() {
    return Container(
      padding: const EdgeInsets.only(bottom: 3 * PdfPageFormat.mm),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: PdfColors.blue,
          ),
        ),
      ),
      child: Row(
        children: [
          PdfLogo(),
          SizedBox(
            width: 0.5 * PdfPageFormat.cm,
          ),
          Text('Create your Pdf'),
        ],
      ),
    );
  }
}
