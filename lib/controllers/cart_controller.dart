import 'package:get/get.dart';
import 'package:get_learn/models/product.dart';

class CartController extends GetxController {
  var cartItems = List<Product>().obs;

  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.value.fold(0, (sum, item) => sum + item.price);

  addToCart(Product product) {
    cartItems.add(product);
  }

  deleteFromCart(Product product) {
    cartItems.remove(product);
  }
}
