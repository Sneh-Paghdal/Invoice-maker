import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:print_invoice/GetX/ProductX.dart';
import 'package:print_invoice/Models/Product.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProductTile extends StatefulWidget {

  final Product product;
  final int index;
  final Function onDelete;

  const ProductTile({required this.product, required this.onDelete, required this.index});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {

  TextEditingController _name = new TextEditingController();
  TextEditingController _price = new TextEditingController();
  TextEditingController _qty = new TextEditingController();
  TextEditingController _pname = new TextEditingController();
  TextEditingController _margin = new TextEditingController();
  int _subttl = 0;
  int _profit = 0;
  ProductX ProductController = Get.put(ProductX());

  String? dropdownValue = null;
  List<String> dropdownItems = [
    '6',
    '8',
    '9.5',
    '10',
    '11.5',
    "12"
  ];

  String? dropdownColorValue = null;
  List<String> dropdownColorItems = [
    'Silver',
    'Shadow',
    'LCD',
  ];

  @override
  void initState() {
    fillInfo();
    super.initState();
  }

  fillInfo(){
    _name.text = widget.product.pname;
    _price.text = widget.product.pprice.toString();
    _qty.text = widget.product.qty.toString();
    _margin.text = widget.product.margin.toString();
    _subttl = widget.product.subttl;
    _profit = widget.product.profit;
    setState(() {});
  }

  void cleanParticular(int n){
    // _name.text = "";
    _pname.text = "";
    _price.text = "";
    _qty.text = "";
    _margin.text = "";
    _subttl = 0;
    _profit = 0;
    dropdownValue = null;
    dropdownColorValue = null;
    ProductController.onClear(n);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Product : ${widget.index + 1}",style: TextStyle(fontWeight: FontWeight.bold),),
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        cleanParticular(widget.index);
                      },
                      child: Text("Clear",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)),
                  SizedBox(width: 20,),
                  GestureDetector(
                      onTap: (){
                        widget.onDelete();
                      },
                      child: Text("Remove",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              labelText: "Chalan number",
            ),
            keyboardType: TextInputType.number,
            controller: _pname,
            onChanged: (value) {
              ProductController.productList[widget.index].pname = _pname.text;
            },
            textCapitalization: TextCapitalization.words,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'SS',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: dropdownItems
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: dropdownValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value;
                      });
                      ProductController.productList[widget.index].ss = value;
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        color: Colors.white,
                      ),
                      // elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                flex: 1,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Text(
                            'Color',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: dropdownColorItems
                        .map((String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                        .toList(),
                    value: dropdownColorValue,
                    onChanged: (String? value) {
                      setState(() {
                        dropdownColorValue = value;
                      });
                      ProductController.productList[widget.index].clr = value;
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      width: 160,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black38,
                        ),
                        color: Colors.white,
                      ),
                      // elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    labelText: "Qty",
                  ),
                  onTap: () => _qty.selection = TextSelection(baseOffset: 0, extentOffset: _qty.value.text.length),
                  controller: _qty,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => updateProductQty(widget.index, value),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      labelText: "Price",
                    ),
                    controller: _price,
                    onTap: () => _price.selection = TextSelection(baseOffset: 0, extentOffset: _price.value.text.length),
                    keyboardType: TextInputType.number,
                    onChanged: (value) => updateProductPrice(widget.index, value),
                  ),
              )
              // Expanded(
              //   flex: 1,
              //   child: Text("S.Total : ${_subttl}",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
              // ),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    labelText: "Margin",
                  ),
                  controller: _margin,
                  keyboardType: TextInputType.number,
                  onTap: () => _margin.selection = TextSelection(baseOffset: 0, extentOffset: _margin.value.text.length),
                  textCapitalization: TextCapitalization.sentences,
                  onChanged: (value) => updateMargin(widget.index, value),
                ),
              ),
              SizedBox(width: 10,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Profit : ${_profit.toString()}"),
                    SizedBox(height: 7,),
                    Text("Total : ${_subttl.toString()}"),
                  ],
                )
              )
              // Expanded(
              //   flex: 1,
              //   child: Text("S.Total : ${_subttl}",style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  void updateProductName(int index, String name) {
    setState(() { // Assuming this is called within a stateful widget
      ProductController.productList[index].pname = name;
    });
  }

  void updateProductPrice(int index, String price) {
    setState(() {
      if(price != ""){
        ProductController.productList[index].pprice = int.parse(price);
      }
      calSubTtl(index);
      calProfit(index);
    });
  }

  void updateMargin(int index, String margin){
    setState(() {
      if(margin != ""){
        ProductController.productList[index].margin = int.parse(margin);
      }
      calSubTtl(index);
      calProfit(index);
    });
  }

  void updateProductQty(int index, String qty) {
    setState(() {
      if(qty != "") {
        ProductController.productList[index].qty =
            int.parse(qty);
      }
      calSubTtl(index);
      calProfit(index);
    });
  }

  void calSubTtl(index){
    if(_qty.text != "" && _price.text != ""){
      _subttl = int.parse(_qty.text) * int.parse(_price.text);
    }else{
      _subttl = 0;
    }
    ProductController.productList[index].subttl = _subttl;
  }

  void calProfit(index){
    if(_qty.text != "" && _margin.text != ""){
      _profit = int.parse(_qty.text) * int.parse(_margin.text);
    }else{
      _profit = 0;
    }
    ProductController.productList[index].profit = _profit;
  }

}
