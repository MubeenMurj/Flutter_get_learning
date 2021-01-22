import 'package:get/get.dart';
import 'package:get_learn/models/product.dart';

class ShoppingController extends GetxController {
  var products = List<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 5)).then((value) {
      var productResult = [
        Product(
          id: 1,
          productName: 'Vivo V15',
          productImage: 'abc',
          productDescription: 'A cell with pop up camera',
          price: 40000.0,
        ),
        Product(
          id: 2,
          productName: 'iPhone XII',
          productImage: 'abc',
          productDescription: 'Latest iPhone',
          price: 200000.0,
        ),
      ];

      products.assignAll(productResult);
    });
  }
}
