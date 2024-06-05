import 'package:get/get.dart';
import 'package:print_invoice/Models/Product.dart';

class ProductX extends GetxController {

  RxList<Product> productList = [
    Product(pid: 0, pname: "", pprice: 0, qty: 1, subttl: 0, margin: 0, ss: null, clr: null, profit : 0),
  ].obs;

  void addProduct() {
    productList.add(Product(
      pid: productList.last.pid + 1,
      pname: "",
      pprice: 0,
      qty: 1,
      subttl: 0,
      margin: 0, profit : 0,
      ss: null,
      clr: null
    ));
    update();
  }

  void removeProduct(int index) {
    productList.removeAt(index);
    update();
  }

  void resetList(){
    productList.value = [];
    productList.add(
      Product(pid: 0, pname: "", pprice: 0, qty: 1, subttl: 0, margin: 0, ss: null, clr: null, profit : 0));
    update();
  }

  void onClear(int index){
    productList[index] = Product(pid: 0, pname: "", pprice: 0, qty: 1, subttl: 0, margin: 0, ss: null, clr: null, profit : 0);
    update();
  }

}
