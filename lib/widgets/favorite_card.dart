import 'package:flutter/material.dart';

class FavoriteItemCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;    // Hàm callback khi nhấn vào thẻ
  final VoidCallback onRemove; // Hàm callback khi nhấn nút xóa

  const FavoriteItemCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Nội dung chính
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(product['image'], width: double.infinity, fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$${product['price'].toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            // Nút Xóa
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: onRemove, // Gọi hàm callback
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.close, size: 18, color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}