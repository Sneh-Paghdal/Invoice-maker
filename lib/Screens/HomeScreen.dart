import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:print_invoice/GetX/InvoiceX.dart';
import 'package:print_invoice/GetX/ProductX.dart';
import 'package:print_invoice/Models/Product.dart';
import 'package:print_invoice/Screens/Preview.dart';
import 'package:print_invoice/Utility/SaveAndOpenPDF.dart';
import 'package:print_invoice/Utility/TablePDFApi.dart';
import 'package:print_invoice/Utility/TmpCode.dart';
import 'package:print_invoice/Widgets/ProductTile.dart';
import 'package:get/get.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ProductX ProductController = Get.put(ProductX());
  InvoiceX InvoiceController = Get.put(InvoiceX());
  TextEditingController _chalan = new TextEditingController();
  TextEditingController _date = new TextEditingController();
  DateTime? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Enter details",style: TextStyle(color: Colors.black),),
        elevation: 1,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: (){
              ProductController.resetList();
              InvoiceController.chalanNo.value = "";
              InvoiceController.dateX.value = "";
              setState(() {
                _chalan.text = "";
                selectedTime = null;
                _date.text = "";
              });
            },
            child: Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.refresh,color: Colors.black,)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 7,),

              // Chalan section starts here
              Row(
                children: [
                  // Expanded(
                  //   flex: 1,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //         border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10),
                  //         ),
                  //         labelText: 'Chalan Number',
                  //         contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0)
                  //     ),
                  //     textCapitalization: TextCapitalization.characters,
                  //     onTap: () => _chalan.selection = TextSelection(baseOffset: 0, extentOffset: _chalan.value.text.length),
                  //     controller: _chalan,
                  //     onChanged: (value){
                  //       if(value != ""){
                  //         InvoiceController.chalanNo.value = value.toString();
                  //       }
                  //     },
                  //   ),
                  // ),
                  // SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: (selectedTime != null) ? selectedTime : DateTime.now(),
                            firstDate:DateTime(2000),
                            lastDate: DateTime(2101)
                        );
                        selectedTime = pickedDate;
                        setState(() {
                          _date.text = "${pickedDate?.day}-${pickedDate?.month}-${pickedDate?.year}";
                          InvoiceController.dateX.value = "${pickedDate?.day}-${pickedDate?.month}-${pickedDate?.year}";
                        });
                      },
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Date',
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0)
                        ),
                        enabled: false,
                        controller: _date,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate:DateTime(2000),
                              lastDate: DateTime(2101)
                          );
                          selectedTime = pickedDate;
                          setState(() {
                            _date.text = "${pickedDate?.day}-${pickedDate?.month}-${pickedDate?.year}";
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
          
              SizedBox(height: 25,),
          
              // Product section starts here
              Text("PRODUCTS (${ProductController.productList.length})",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
              SizedBox(height: 10,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ProductController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(product: ProductController.productList[index], onDelete: (){
                    if(index != 0){
                        ProductController.removeProduct(index);
                      }
                      setState(() {}); }, index: index,);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  GestureDetector(
                    onTap: (){
                      ProductController.addProduct();
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        child: GestureDetector(
          onTap: () async {
            // if(InvoiceController.chalanNo.value == ""){
            //   CherryToast.error(
            //       description:  Text("Chalan number is required", style: TextStyle(color: Colors.black)),
            //       animationType:  AnimationType.fromRight,
            //       animationDuration:  Duration(milliseconds:  1000),
            //       autoDismiss:  true
            //   ).show(context);
            // }else
              if(InvoiceController.dateX.value == ""){
              CherryToast.error(
                  description:  Text("Date is required", style: TextStyle(color: Colors.black)),
                  animationType:  AnimationType.fromRight,
                  animationDuration:  Duration(milliseconds:  1000),
                  autoDismiss:  true
              ).show(context);
            }
            // print(ProductController.productList[0] == Product(pname: "", pprice: 0, qty: 1, subttl: 0, margin: 0, ss: null, clr: null, profit : 0));
            // print(ProductController.productList[0].pname == "");
            // print(ProductController.productList[0].pprice == 0);
            // print(ProductController.productList[0].qty == 1);
            // print(ProductController.productList[0].subttl == 0);
            // print(ProductController.productList[0].margin == 0);
            // print(ProductController.productList[0].ss == null);
            // print(ProductController.productList[0].clr == null);
            // print(ProductController.productList[0].profit == 0);

            //(ProductController.productList[0].pname == "" && ProductController.productList[0].pprice == 0 && ProductController.productList[0].qty == 1 &&
            // ProductController.productList[0].subttl == 0 && ProductController.productList[0].margin == 0 && ProductController.productList[0].ss == null &&
            // ProductController.productList[0].clr == null && ProductController.productList[0].profit == 0)
            else if(ProductController.productList.length == 1 &&
            (ProductController.productList[0].pname == "" && ProductController.productList[0].pprice == 0 && ProductController.productList[0].qty == 1 &&
            ProductController.productList[0].subttl == 0 && ProductController.productList[0].margin == 0 && ProductController.productList[0].ss == null &&
            ProductController.productList[0].clr == null && ProductController.productList[0].profit == 0)
            ){
              CherryToast.error(
                  description:  Text("Please enter atleast one record", style: TextStyle(color: Colors.black)),
                  animationType:  AnimationType.fromRight,
                  animationDuration:  Duration(milliseconds:  1000),
                  autoDismiss:  true
              ).show(context);
            }else{
              final tablePDF = await TablePDFApi.generateTablePDF();
              SaveAndOpenPDF.openPDF(tablePDF);
            }
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
                color: Colors.blue,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text("Preview",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
