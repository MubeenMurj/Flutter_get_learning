import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_learn/controllers/cart_controller.dart';
import 'package:get_learn/controllers/shopping_controller.dart';

import 'cart.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffAEB6BF),
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket_outlined),
            onPressed: () => Get.to(
              CartPage(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) => ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: TextStyle(
                                          fontSize: 30.0,
                                        ),
                                      ),
                                      Text(controller
                                          .products[index].productDescription),
                                    ],
                                  ),
                                ),
                                Text(
                                  '\$${controller.products[index].price}',
                                  style: TextStyle(
                                    fontSize: 26.0,
                                  ),
                                ),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: Text('ADD TO CART'),
                              color: Color(0xffF1C40F),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            GetX<CartController>(
              builder: (controller) => Text(
                'Total amount: \$${controller.totalPrice}',
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.to(
          CartPage(),
        ),
        icon: Icon(Icons.add_shopping_cart_rounded),
        label: GetX<CartController>(
          builder: (controller) => Text('${controller.count}'),
        ),
      ),
    );
  }
}
