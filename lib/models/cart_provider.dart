import 'package:flutter/material.dart';
import 'package:my_app/models/cart_item.dart';
import 'package:my_app/models/grocery_item.dart';

class CartProvider extends ChangeNotifier{

  final List<CartItem> _items = [];
  List<CartItem> get items => _items;

  void addToCart(Grocery grocery) {
    // Find the index of the grocery item in the cart
    final index = _items.indexWhere((item) => item.grocery.id == grocery.id);
    // If the grocery item is already in the cart 
    if (index >= 0) {
       // Increase the quantity by 1
      _items[index].quantity++;
    } else {
      _items.add(CartItem(grocery: grocery));
    }
    notifyListeners();
  }

    void removeFromCart(Grocery grocery) {
    final index = _items.indexWhere((item) => item.grocery.id == grocery.id);
    if (index >= 0) {
      _items.removeAt(index);
    }
    notifyListeners();
  }

  void increaseQuantity(Grocery grocery){
    final index = _items.indexWhere((item)=>item.grocery.id == grocery.id);
    if(index >= 0){
      _items[index].quantity++;
    }
    notifyListeners();
  }

    void decreaseQuantity(Grocery grocery){
    final index = _items.indexWhere((item)=>item.grocery.id == grocery.id);
    if(index >= 0){
      _items[index].quantity--;
    }
    notifyListeners();
  }

  bool itemInorNot(Grocery grocery){
    return _items.any((item)=>item.grocery.id == grocery.id);
  }

  int getQuantity(Grocery grocery){
    final index = _items.indexWhere((item)=>item.grocery.id == grocery.id);
    if(index >= 0){
      return _items[index].quantity;
    }
    return 0;
  }

 String calculateTotal(){
  double totalprice = 0;
 _items.forEach((item){
  totalprice += item.grocery.price * item.quantity;
 });
  return totalprice.toStringAsFixed(2);
 }
}