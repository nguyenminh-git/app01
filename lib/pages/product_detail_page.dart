// File: lib/pages/product_detail_page.dart
import 'package:flutter/material.dart';
import 'package:project1/widgets/product_option_sheet.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final double price;
  final String image;

  const ProductDetailPage({
    super.key,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // Dùng SafeArea để tránh tai thỏ/thanh điều hướng
      body: SafeArea(
        child: Column(
          children: [
            // --- PHẦN 1: NỘI DUNG CUỘN (Ảnh + Chữ) ---
            Expanded( // Bắt buộc phần này chiếm hết khoảng trống phía trên
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ảnh sản phẩm
                    Container(
                      height: 300,
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: Image.asset(image, fit: BoxFit.contain),
                    ),
                    
                    // Thông tin chi tiết
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '\$${price.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Mô tả sản phẩm:",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Đây là mô tả chi tiết của sản phẩm $name. Chất liệu thoáng mát, thiết kế thời trang phù hợp với mọi lứa tuổi.",
                            style: TextStyle(color: Colors.grey[600], height: 1.5),
                          ),
                          // Thử thêm text dài để test cuộn
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            // --- PHẦN 2: NÚT BẤM (Cố định ở đáy) ---
            // Không dùng Spacer nữa, vì nó nằm ngoài ScrollView rồi
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [ // Thêm bóng đổ nhẹ cho đẹp
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -5)
                  )
                ]
              ),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                  ),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Cho phép sheet cao hơn nửa màn hình
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) {
                        return ProductOptionSheet(
                          image: image, // Truyền ảnh từ trang chi tiết vào
                          price: price, // Truyền giá vào
                        );
                      },
                    );
                  },
                  child: Text("Thêm vào giỏ hàng", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}