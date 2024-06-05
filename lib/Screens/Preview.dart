import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:print_invoice/GetX/ProductX.dart';
import 'package:get/get.dart';

class Preview extends StatefulWidget {
  const Preview({super.key});

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {

  ProductX ProductController = Get.put(ProductX());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: ProductController.productList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text("Name : ${ProductController.productList[index].pname}"),
                Text("Price : ${ProductController.productList[index].pprice}"),
                Text("Qty : ${ProductController.productList[index].qty}"),
                Text("S.Total : ${ProductController.productList[index].subttl}")
              ],
            ),
          );
        },
      ),
    );
  }
}
