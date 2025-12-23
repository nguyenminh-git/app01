import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final VoidCallback onTap; // <--- 1. Thêm biến này

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap, // <--- 2. Yêu cầu truyền vào
  });

  @override
  Widget build(BuildContext context) {
    // 3. Bọc Container bằng GestureDetector để bắt sự kiện nhấn
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        width: 120,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, // Thêm màu nền để tránh lỗi click xuyên thấu
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)), // Sửa lại cho đẹp
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('\$${price.toStringAsFixed(2)}'),
            )
          ],
        ),
      ),
    );
  }
}