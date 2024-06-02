import 'product.dart';

class Cart {
  final Product product;
  int quantity;

  Cart({required this.product, required this.quantity});
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[2], quantity: 1),
  Cart(product: demoProducts[1], quantity: 2),
];

void addToCart(Product product) {
  final cartItem = demoCarts.firstWhere(
    (item) => item.product.id == product.id,
    orElse: () => Cart(product: product, quantity: 0),
  );

  if (cartItem.quantity == 0) {
    demoCarts.add(Cart(product: product, quantity: 1));
  } else {
    cartItem.quantity++;
  }
}

void removeFromCart(Product product) {
  final cartItem = demoCarts.firstWhere(
    (item) => item.product.id == product.id,
    orElse: () => Cart(product: product, quantity: 0),
  );

  if (cartItem.quantity > 1) {
    cartItem.quantity--;
  } else {
    demoCarts.removeWhere((item) => item.product.id == product.id);
  }
}
