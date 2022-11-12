class Product {
  String name;
  double price;
  int quantity;
  String id;
  String cartId;
  Product(
      {this.id = '',
      required this.name,
      required this.price,
      required this.quantity,
      this.cartId = ''});
}
