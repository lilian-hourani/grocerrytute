// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final color;
  void  Function()? onPressed;
   GroceryItemTile({super.key,
  required this.color,
  required this.itemName,
  required this.itemPath,
  required this.itemPrice,
  required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding:EdgeInsets.all(12) ,
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(itemPath,height: 64,),
            Text(itemName),
            MaterialButton(
            onPressed: onPressed,
            color: color[700],
            child: Text('\$' + itemPrice,
             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            ),
            )
          ],
        ),
      ),
    );
  }
}