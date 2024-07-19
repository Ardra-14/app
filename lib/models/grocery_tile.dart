import 'package:flutter/material.dart';
import 'package:my_app/models/cart_provider.dart';
import 'package:my_app/models/grocery_item.dart';
import 'package:provider/provider.dart';

class GroceryTile extends StatelessWidget {
  
  final Grocery grocery;

  GroceryTile({super.key, required this.grocery});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final isInCart = cartProvider.itemInorNot(grocery);
    final quantity = cartProvider.getQuantity(grocery);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color.fromARGB(255, 218, 216, 216),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image

            Image.asset(
              grocery.imagePath,
              height: 64,
            ),

            //itemname
            Text(
              grocery.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            //price

            Text(
              'Rs. ' + grocery.price.toStringAsFixed(2),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            //add to cart button
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isInCart
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
                  ),
                  onPressed: () {
                    if (isInCart) {
                      cartProvider.removeFromCart(grocery);
                    } else {
                      cartProvider.addToCart(grocery);
                    }
                  },
                ),
                if (isInCart)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            cartProvider.decreaseQuantity(grocery);
                          },
                        ),
                        Text('$quantity'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            cartProvider.increaseQuantity(grocery);
                          },
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
