// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:grocerrytute/model/cart_model.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0,
       iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Consumer<CartModel> (
        builder: (context, value, child) {
          return Column(
            children: [
               Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('My Cart',style: TextStyle(fontSize:40,fontFamily: 'NotoSerif-Italic-VariableFont_wdth,wght',fontWeight: FontWeight.bold ),),
            ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.cartItem.length,
                  padding: EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: ListTile(
                          leading: Image.asset(value.cartItem[index][2],height: 36),
                          title: Text(value.cartItem[index][0]),
                          subtitle: Text( '\$' + value.cartItem[index][1]),
                          trailing:IconButton(
                            onPressed:() => Provider.of<CartModel>(context , listen: false).removeItem(index),
                            icon:  Icon(Icons.cancel),)
                        ),
                      ),
                    );
                  }
                  
                 )),
                 Padding(
                   padding: const EdgeInsets.all(36),
                   child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    padding: EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Price',
                            style: TextStyle(color: Colors.green[100]),
                            ),
                            SizedBox(height: 4,),
                            Text( '\$' + value.calculateTotal(),
                            style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold) ,)
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green.shade100),
                            borderRadius: BorderRadius.circular(12)
                          ),
                          padding: EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text('Pay Now',
                              style: TextStyle(color: Colors.white),
                              ),
                             Icon(Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.white,
                          )
                            ],
                          ),
                         
                        )
                      ],
                    ),
                   ),
                 )
            ],
          );
        }

         ,),
    );
  }
}