import 'package:flutter/material.dart';
import 'package:project1/pages/product_detail_page.dart';
import 'package:project1/widgets/favorite_card.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // Dữ liệu vẫn giữ ở đây (hoặc chuyển sang file data riêng nếu muốn xịn hơn)
  final List<Map<String, dynamic>> _favoriteProducts = [
    {"name": "Áo Khoác Blazer", "price": 45.00, "image": "assets/images/1iphone12.jpg"},
    {"name": "Đầm Dự Tiệc Đỏ", "price": 60.50, "image": "assets/images/1iphone12.jpg"},
    {"name": "Túi Xách Da Mềm", "price": 35.00, "image": "assets/images/1iphone12.jpg"},
    {"name": "Giày Cao Gót", "price": 28.99, "image": "assets/images/1iphone12.jpg"},
  ];

  void _removeFromFavorites(int index) {
    setState(() {
      _favoriteProducts.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Đã xóa khỏi danh sách yêu thích"), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yêu thích", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text("(${_favoriteProducts.length})", style: const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: _favoriteProducts.isEmpty ? _buildEmptyState() : _buildGridList(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text("Danh sách yêu thích trống", style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }

  // Code phần này giờ rất ngắn và dễ hiểu
  Widget _buildGridList() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GridView.builder(
        itemCount: _favoriteProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          final product = _favoriteProducts[index];
          
          // GỌI WIDGET MỚI TẠI ĐÂY
          return FavoriteItemCard(
            product: product,
            
            // Xử lý logic xóa
            onRemove: () => _removeFromFavorites(index),
            
            // Xử lý logic chuyển trang
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(
                    name: product['name'],
                    price: product['price'],
                    image: product['image'],
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