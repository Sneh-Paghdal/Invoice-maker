import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:print_invoice/GetX/InvoiceX.dart';
import 'package:print_invoice/GetX/ProductX.dart';
import 'package:print_invoice/Models/Product.dart';
import 'SaveAndOpenPDF.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';

class TablePDFApi {
  static Future<File> generateTablePDF() async {
    final pdf = pw.Document();
    ProductX ProductController = Get.put(ProductX());
    InvoiceX InvoiceController = Get.put(InvoiceX());
    pdf.addPage(
        pw.Page(build: (pw.Context context) {
      return pw.Container(
          width: double.infinity,
          // decoration: pw.BoxDecoration(
          //     border: pw.Border(top: pw.BorderSide(color: PdfColors.black, width: 1),left: pw.BorderSide(color: PdfColors.black, width: 1),right: pw.BorderSide(color: PdfColors.black, width: 1))),
          child: pw.Column(children: [
            pw.Container(
                padding: pw.EdgeInsets.all(10),
                width: double.infinity,
                alignment: pw.Alignment.center,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black,width: 1)
                  // border: pw.Border(
                  //     bottom: pw.BorderSide(color: PdfColors.black, width: 1)),
                ),
                child: pw.Text("Hot Fix Jarkan",
                    style: pw.TextStyle(
                        fontWeight: pw.FontWeight.bold, fontSize: 18))),
            pw.Container(
              decoration: pw.BoxDecoration(
                  border: pw.Border(
                      bottom: pw.BorderSide(color: PdfColors.black, width: 1),
                      left: pw.BorderSide(color: PdfColors.black, width: 1)
                  )),
              child: pw.Row(
                children: [
                  pw.Expanded(
                      flex: 5,
                      child: pw.Container(
                          padding: pw.EdgeInsets.only(left: 10),
                          child: pw.Row(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("Bailed to :",
                                    style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(width: 10),
                                pw.Column(
                                    crossAxisAlignment:
                                        pw.CrossAxisAlignment.start,
                                    children: [
                                      pw.Text("Jitubhai Paladiya",
                                          style: pw.TextStyle(
                                              fontWeight: pw.FontWeight.bold,
                                              fontSize: 16)),
                                      pw.SizedBox(height: 5),
                                      pw.Text("Mo : 9925744396"),
                                    ])
                              ]))),
                  pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                left: pw.BorderSide(
                                    color: PdfColors.black, width: 1),
                                right: pw.BorderSide(color: PdfColors.black, width: 1)
                            ),
                          ),
                          child: pw.Column(children: [
                            pw.Container(
                              padding: pw.EdgeInsets.all(7),
                              width: double.infinity,
                              decoration: pw.BoxDecoration(
                                border: pw.Border(
                                    bottom: pw.BorderSide(
                                        color: PdfColors.black, width: 1)),
                              ),
                              alignment: pw.Alignment.center,
                              child: pw.Text("CHALLAN",
                                  style: pw.TextStyle(
                                      fontWeight: pw.FontWeight.bold,
                                      fontSize: 18)),
                            ),
                            pw.Container(
                                padding: pw.EdgeInsets.all(7),
                                child: pw.Column(children: [
                                  pw.Row(children: [
                                    pw.Text("Num :"),
                                    pw.Spacer(),
                                    pw.Text("${InvoiceController.chalanNo.value}")
                                  ]),
                                  pw.Row(children: [
                                    pw.Text("Date :"),
                                    pw.Spacer(),
                                    pw.Text("${InvoiceController.dateX.value}")
                                  ]),
                                ]))
                          ]))),
                ],
              ),
            ),
            pw.Container(
                decoration: pw.BoxDecoration(
                  border: pw.Border(
                      bottom: pw.BorderSide(color: PdfColors.black, width: 1)),
                ),
                child: pw.Row(children: [
                  pw.Expanded(
                      flex: 2,
                      child: pw.Container(
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                right: pw.BorderSide(
                                    color: PdfColors.black, width: 1),
                                left: pw.BorderSide(color: PdfColors.black, width: 1)
                            ),
                          ),
                          alignment: pw.Alignment.center,
                          child: pw.Text("Person"))),
                  pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                right: pw.BorderSide(
                                    color: PdfColors.black, width: 1)),
                          ),
                          child: pw.Text("Name"))),
                  pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                right: pw.BorderSide(
                                    color: PdfColors.black, width: 1)),
                          ),
                          child: pw.Text("Qty"))),
                  pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                right: pw.BorderSide(
                                    color: PdfColors.black, width: 1)),
                          ),
                          child: pw.Text("Price"))),
                  pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                right: pw.BorderSide(
                                    color: PdfColors.black, width: 1)),
                          ),
                          child: pw.Text("Margin"))),
                  pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          decoration: pw.BoxDecoration(
                            border: pw.Border(
                                right: pw.BorderSide(
                                    color: PdfColors.black, width: 1)),
                          ),
                          child: pw.Text("Profit"))),
                  pw.Expanded(
                      child: pw.Container(
                          alignment: pw.Alignment.center,
                          decoration: pw.BoxDecoration(
                            border: pw.Border(right: pw.BorderSide(color: PdfColors.black, width: 1))
                          ),
                          padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                          child: pw.Text("Total"))),
                ])),
            for (int i = 0; i < ProductController.productList.length; i++) ...[
              if(ProductController.productList[i] != Product(pid: 0, pname: "", pprice: 0, qty: 1, subttl: 0, margin: 0, ss: null, clr: null, profit : 0))...[
              pw.Container(
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        bottom:
                            pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  child: pw.Row(children: [
                    pw.Expanded(
                        flex: 2,
                        child: pw.Container(
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(
                                      color: PdfColors.black, width: 1),
                                  left: pw.BorderSide(
                                      color: PdfColors.black, width: 1)
                              ),
                            ),
                            alignment: pw.Alignment.center,
                            child: pw.Text(
                                "${ProductController.productList[i].pname}",
                                style: pw.TextStyle(fontSize: 10)))),
                    pw.Expanded(
                        child: pw.Container(
                            alignment: pw.Alignment.center,
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(
                                      color: PdfColors.black, width: 1)),
                            ),
                            child: pw.Text(
                                "${ProductController.productList[i].ss} ${ProductController.productList[i].clr}",
                                style: pw.TextStyle(fontSize: 10)))),
                    pw.Expanded(
                        child: pw.Container(
                            alignment: pw.Alignment.center,
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(
                                      color: PdfColors.black, width: 1)),
                            ),
                            child: pw.Text(
                                "${ProductController.productList[i].qty}",
                                style: pw.TextStyle(fontSize: 10)))),
                    pw.Expanded(
                        child: pw.Container(
                            alignment: pw.Alignment.center,
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(
                                      color: PdfColors.black, width: 1)),
                            ),
                            child: pw.Text(
                                "${ProductController.productList[i].pprice}",
                                style: pw.TextStyle(fontSize: 10)))),
                    pw.Expanded(
                        child: pw.Container(
                            alignment: pw.Alignment.center,
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(
                                      color: PdfColors.black, width: 1)),
                            ),
                            child: pw.Text(
                                "${ProductController.productList[i].margin}",
                                style: pw.TextStyle(fontSize: 10)))),
                    pw.Expanded(
                        child: pw.Container(
                            alignment: pw.Alignment.center,
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            decoration: pw.BoxDecoration(
                              border: pw.Border(
                                  right: pw.BorderSide(
                                      color: PdfColors.black, width: 1)),
                            ),
                            child: pw.Text(
                                "${ProductController.productList[i].profit}",
                                style: pw.TextStyle(fontSize: 10)))),
                    pw.Expanded(
                        child: pw.Container(
                            alignment: pw.Alignment.center,
                            decoration: pw.BoxDecoration(
                                border: pw.Border(right: pw.BorderSide(color: PdfColors.black, width: 1))
                            ),
                            padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                            child: pw.Text(
                                "${ProductController.productList[i].subttl}",
                                style: pw.TextStyle(fontSize: 10)))),
                  ]))
              ]
            ]
          ]));
    }));
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    String tmp_name = "invoice_$timestamp.pdf";
    return SaveAndOpenPDF.savePDF(name: tmp_name, pdf: pdf);
  }

  pw.Widget tableData(String person, String name, int qty, int price,
      int margin, int profit, int total) {
    return pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border(
              bottom: pw.BorderSide(color: PdfColors.black, width: 1)),
        ),
        child: pw.Row(children: [
          pw.Expanded(
              flex: 2,
              child: pw.Container(
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        right: pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  alignment: pw.Alignment.center,
                  child:
                      pw.Text("$person", style: pw.TextStyle(fontSize: 10)))),
          pw.Expanded(
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        right: pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  child: pw.Text("$name", style: pw.TextStyle(fontSize: 10)))),
          pw.Expanded(
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        right: pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  child: pw.Text("${qty.toString()}",
                      style: pw.TextStyle(fontSize: 10)))),
          pw.Expanded(
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        right: pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  child: pw.Text("${price.toString()}",
                      style: pw.TextStyle(fontSize: 10)))),
          pw.Expanded(
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        right: pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  child: pw.Text("${margin.toString()}",
                      style: pw.TextStyle(fontSize: 10)))),
          pw.Expanded(
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  decoration: pw.BoxDecoration(
                    border: pw.Border(
                        right: pw.BorderSide(color: PdfColors.black, width: 1)),
                  ),
                  child:
                      pw.Text("${profit}", style: pw.TextStyle(fontSize: 10)))),
          pw.Expanded(
              child: pw.Container(
                  alignment: pw.Alignment.center,
                  padding: pw.EdgeInsets.only(top: 7, bottom: 7),
                  child: pw.Text("${total.toString()}",
                      style: pw.TextStyle(fontSize: 10)))),
        ]));
  }
}
