import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_learn/controllers/cart_controller.dart';
import 'package:get_learn/controllers/shopping_controller.dart';

class CartPage extends StatelessWidget {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: GetX<CartController>(
                  builder: (controller) => ListView.builder(
                    itemCount: controller.cartItems.length,
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
                                          controller
                                              .cartItems[index].productName,
                                          style: TextStyle(
                                            fontSize: 30.0,
                                          ),
                                        ),
                                        Text(controller.cartItems[index]
                                            .productDescription),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '\$${controller.cartItems[index].price}',
                                    style: TextStyle(
                                      fontSize: 26.0,
                                    ),
                                  ),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController.deleteFromCart(
                                      controller.cartItems[index]);
                                },
                                child: Icon(
                                  Icons.delete_outline,
                                  color: Colors.redAccent,
                                ),
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
                builder: (controller) => Text('Total: ${controller.count}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
