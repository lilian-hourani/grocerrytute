import 'package:flutter/material.dart';
class CartModel extends ChangeNotifier{
  final List _shopItems = [
    ["Avocado","4.00","images/avocado.png",Colors.green],
    ["Banana","2.50","images/banana.png",Colors.yellow],
    ["Chicken","12.80","images/chicken.png",Colors.brown],
    ["Water","1.00","images/water.png",Colors.blue],
  ];
  List _cartItem = [];
  get shopItems => _shopItems;
  get  cartItem => _cartItem;

  void addItem (int index){
    _cartItem.add(_shopItems[index]);
    notifyListeners();
  }

   void removeItem (int index){
    _cartItem.removeAt(index);
    notifyListeners();
  }
  String calculateTotal(){
    double totalPrice = 0;
    for(int i = 0 ; i < _cartItem.length ; i++){
      totalPrice += double.parse(_cartItem[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}