class Product {
  // int pid;
  String pname;
  int pprice;
  int qty;
  int subttl;
  int profit;
  int margin;
  String? ss;
  String? clr;

  Product({
    // required this.pid,
    required this.pname, required this.pprice, required this.qty, required this.subttl, this.ss, this.clr, required this.margin, required this.profit});
}
