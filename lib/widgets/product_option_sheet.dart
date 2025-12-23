// File: lib/widgets/product_option_sheet.dart
import 'package:flutter/material.dart';

class ProductOptionSheet extends StatefulWidget {
  final String image;
  final double price;

  const ProductOptionSheet({
    super.key,
    required this.image,
    required this.price,
  });

  @override
  State<ProductOptionSheet> createState() => _ProductOptionSheetState();
}

class _ProductOptionSheetState extends State<ProductOptionSheet> {
  int _quantity = 1;
  String _selectedSize = 'M';
  final List<String> sizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      // Chiều cao tối đa là 80% màn hình, tối thiểu theo nội dung
      height: MediaQuery.of(context).size.height * 0.7, 
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header: Ảnh nhỏ + Giá + Nút tắt
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(widget.image, width: 80, height: 80, fit: BoxFit.cover),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${widget.price.toStringAsFixed(2)}', 
                      style: const TextStyle(fontSize: 20, color: Colors.pink, fontWeight: FontWeight.bold)),
                    const Text('Kho: 120 sản phẩm', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              )
            ],
          ),
          
          const Divider(height: 30),

          // 2. Chọn Size (Cấu hình)
          const Text('Chọn Size', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children: sizes.map((size) {
              final isSelected = _selectedSize == size;
              return ChoiceChip(
                label: Text(size),
                selected: isSelected,
                selectedColor: Colors.pink[100],
                labelStyle: TextStyle(color: isSelected ? Colors.pink : Colors.black),
                onSelected: (selected) {
                  setState(() {
                    _selectedSize = size;
                  });
                },
              );
            }).toList(),
          ),

          const SizedBox(height: 20),
          const Text('Số lượng', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildQtyButton(Icons.remove, () {
                if (_quantity > 1) setState(() => _quantity--);
              }),
              Container(
                width: 50,
                alignment: Alignment.center,
                child: Text('$_quantity', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              _buildQtyButton(Icons.add, () {
                setState(() => _quantity++);
              }),
            ],
          ),

          const Spacer(),

          // 4. Nút xác nhận
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                // Xử lý logic thêm vào giỏ hàng ở đây
                Navigator.pop(context); // Đóng sheet
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Đã thêm $_quantity sản phẩm size $_selectedSize vào giỏ!')),
                );
              },
              child: const Text("Xác nhận", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          )
        ],
      ),
    );
  }

  // Widget nút cộng trừ nhỏ gọn
  Widget _buildQtyButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(icon, size: 16),
      ),
    );
  }
}