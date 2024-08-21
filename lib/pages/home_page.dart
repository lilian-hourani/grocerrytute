// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:grocerrytute/components/grocery_item.dart';
import 'package:grocerrytute/model/cart_model.dart';
import 'package:grocerrytute/pages/cart_page.dart';
import 'package:provider/provider.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context, MaterialPageRoute(
            builder: (context) {return CartPage();
            }
            )),
            backgroundColor: Colors.black87,
            child: Icon(Icons.shopping_bag,color: Colors.white),),
            body: SafeArea(
             child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Good morning,',style: TextStyle(fontFamily: 'NotoSerif-Italic-VariableFont_wdth,wght')),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Lets order fresh items for you',style: TextStyle(fontSize:40,fontFamily: 'NotoSerif-Italic-VariableFont_wdth,wght',fontWeight: FontWeight.bold ),),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Fresh Items',style: TextStyle(fontSize: 16),),
            ),
            Expanded(child: Consumer<CartModel>(
              builder:(context,value,Child) {
                return GridView.builder(
                  itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                    ), 
                  itemBuilder: (context,index) {
                    return GroceryItemTile(
                       itemName:  value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        itemPath: value.shopItems[index][2],
                       color: value.shopItems[index][3],
                       onPressed: (){
                        Provider.of<CartModel>(context , listen: false ).addItem(index);
                       },
                        );
                  });
              }))
          ],
        ),
      ),
    );
  }
}