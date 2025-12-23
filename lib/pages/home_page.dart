import 'package:flutter/material.dart';
import 'package:project1/widgets/banner_slide.dart';
import 'package:project1/widgets/product_list.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 15),
            BannerSlide(),
            SizedBox(height: 15),
            ProductList(),
            SizedBox(height: 15),
            ProductList(),
            SizedBox(height: 15),
            ProductList(),
            SizedBox(height: 15),
            ProductList(),
          ],
        )
      ),
    );
  }
}