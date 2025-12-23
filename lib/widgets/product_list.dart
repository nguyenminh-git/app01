import 'package:flutter/material.dart';
import 'package:project1/widgets/product_card.dart';
import 'package:project1/pages/product_detail_page.dart'; // Nhớ import trang chi tiết

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        "name": "T-shirt",
        "price": 15.00,
        "image": "assets/images/1iphone12.jpg",
      },
      {
        "name": "Jeans",
        "price": 25.00,
        "image": "assets/images/1iphone12.jpg",
      },
      {
        "name": "Jacket",
        "price": 28.00,
        "image": "assets/images/1iphone12.jpg",
      },
    ];

    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          
          return ProductCard(
            name: p["name"] as String,
            price: p["price"] as double,
            image: p["image"] as String,
            // XỬ LÝ SỰ KIỆN NHẤN TẠI ĐÂY
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    name: p["name"] as String,
                    price: p["price"] as double,
                    image: p["image"] as String,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}