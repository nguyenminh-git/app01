import 'package:flutter/material.dart';
import 'package:project1/pages/main_page.dart';


class FristPage extends StatelessWidget {
  const FristPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300,),
            Text('FASHION HUB',style: TextStyle(fontSize: 35,color: Colors.pink,fontWeight: FontWeight.bold),),
            Spacer(),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                  
                ),
                onPressed: (){Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context)=>MainPage())
                );}, 
                child: Text('Go To Shop',style: TextStyle(fontSize: 18,color: Colors.black),)
              ),
            ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}