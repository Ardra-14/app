import 'package:flutter/material.dart';
import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/cart_provider.dart';
import 'package:my_app/models/grocery_item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final List<CartItem> cartItems = cartProvider.items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final CartItem cartItem = cartItems[index];
                return ListTile(
                  leading: Image.asset(
                    cartItem.grocery.imagePath,
                    height: 50,
                  ),
                  title: Text(cartItem.grocery.name),
                  subtitle: Text('Quantity: ${cartItems[index].quantity}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      cartProvider.removeFromCart(cartItem.grocery);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(36),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Rs." + cartProvider.calculateTotal(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
