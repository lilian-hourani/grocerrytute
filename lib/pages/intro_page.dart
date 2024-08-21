// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:grocerrytute/pages/home_page.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 130,bottom: 25,left: 80,right: 80),
          child: Image.asset('images/avocado.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Text('We deliver groceries at your doorstep',style: TextStyle( fontSize: 40,fontFamily: 'NotoSerif-Italic-VariableFont_wdth,wght',fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        ),
        SizedBox(height: 24),
        Text('Fresh item everyday',style: TextStyle(color: Colors.grey[600],fontFamily: 'NotoSerif-Italic-VariableFont_wdth,wght',fontSize: 16 ),),
        Spacer(),
        OutlinedButton(
           style: OutlinedButton.styleFrom(
                    fixedSize:const Size(148, 70),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                  onPressed: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
                  },
                   child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'NotoSerif-Italic-VariableFont_wdth,wght',
                      color: Colors.white, 
                    ),
                   )),
                   Spacer(),
      ],
    ),
    );
  }
}