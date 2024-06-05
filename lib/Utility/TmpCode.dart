import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

const String _name = 'JITUBHAI PALADIYA';
const String _mobileNumber = '9925744396';
const String _challanNumber = 'CH-253';
const String _date = '03/06/2024';
const List<String> _items = [
  '9.5 LCD',
  'I NIMNMIS',
  '100 PKT',
];
const double _price = 161.00;
const int _quantity = 100;
const double _totalAmount = 16100.00;

Future<File> createPdf() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Row(
              children: [
                pw.Text('Billed To:'),
                pw.Spacer(),
                pw.Text(_name),
              ],
            ),
            pw.Row(
              children: [
                pw.Text('Mo:'),
                pw.Text(_mobileNumber),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Center(
              child: pw.Text(
                'CHALLAN',
                style: pw.TextStyle(
                  fontSize: 20,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
            ),
            pw.SizedBox(height: 10),
            pw.Row(
              children: [
                pw.Text('Number:'),
                pw.Spacer(),
                pw.Text(_challanNumber),
              ],
            ),
            pw.Row(
              children: [
                pw.Text('Date:'),
                pw.Spacer(),
                pw.Text(_date),
              ],
            ),
            pw.Divider(thickness: 2),
            pw.Row(
              children: [
                pw.Expanded(child: pw.Text('Item')),
                pw.Text('Qty'),
                pw.Text('Plate'),
                pw.Text('Total'),
              ],
            ),
            pw.Divider(thickness: 1),
            for (var item in _items)
              pw.Row(
                children: [
                  pw.Expanded(child: pw.Text(item)),
                  pw.Text('...'), // Placeholder for quantity
                  pw.Text('...'), // Placeholder for plate
                  pw.Text('...'), // Placeholder for total price
                ],
              ),
            pw.Divider(thickness: 1),
            pw.Row(
              children: [
                pw.Text('Total qty'),
                pw.Spacer(),
                pw.Text('$_quantity(PKT)'),
              ],
            ),
            pw.SizedBox(height: 20),
            pw.Row(
              children: [
                pw.Text('Net Amount'),
                pw.Spacer(),
                pw.Text('$_totalAmount.00'),
              ],
            ),
            pw.SizedBox(height: 10),
            pw.Text('Net Amount in Words'),
            pw.Text('Sixteen Thousand One Hundred Rupees Only'),
            pw.SizedBox(height: 20),
            pw.Row(
              children: [
                pw.Text('Receiver\'s Signature'),
                pw.Spacer(),
                pw.Text('Authorised Signature'),
              ],
            ),
            pw.Text('Generated using hital.c'),
          ],
        );
      },
    ),
  );

  // Save the PDF document
  final file = File('my_invoice.pdf');
  await file.writeAsBytes(await pdf.save());
  return file;
}
