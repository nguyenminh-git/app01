import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    // Dùng SingleChildScrollView để tránh lỗi tràn màn hình khi bàn phím hiện lên
    return SingleChildScrollView( 
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho toàn bộ nội dung
          children: [
            // --- 1. THANH TÌM KIẾM ---
            SizedBox(
              height: 50, // Đặt chiều cao cố định cho đẹp
              child: TextField(
                autofocus: false, // Thường không nên autofocus ngay khi vừa vào tab
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm sản phẩm...',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            // --- KHOẢNG CÁCH ---
            const SizedBox(height: 20),

            // --- 2. TIÊU ĐỀ 1: LỊCH SỬ TÌM KIẾM ---
            const Text(
              'Tìm kiếm gần đây',
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),
            ),
            const SizedBox(height: 10),
            
            // Ví dụ danh sách các từ khóa cũ (dùng Wrap để tự xuống dòng)
            Wrap(
              spacing: 8.0, // Khoảng cách ngang
              children: [
                _buildSearchChip('Áo thun'),
                _buildSearchChip('Váy hoa'),
                _buildSearchChip('Giày sneaker'),
              ],
            ),

            // --- KHOẢNG CÁCH ---
            const SizedBox(height: 30),

            // --- 3. TIÊU ĐỀ 2: GỢI Ý ---
            const Text(
              'Từ khóa phổ biến',
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
                color: Colors.pink // Màu hồng theo theme Fashion Hub
              ),
            ),
            const SizedBox(height: 10),

            // Danh sách gợi ý
            Column(
              children: [
                _buildTrendingItem('Bộ sưu tập mùa hè'),
                _buildTrendingItem('Túi xách cao cấp'),
                _buildTrendingItem('Đầm dự tiệc'),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Hàm phụ để tạo các Chip (thẻ nhỏ) cho gọn code
  Widget _buildSearchChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
      deleteIcon: Icon(Icons.close, size: 18),
      onDeleted: () {}, // Xử lý xóa lịch sử ở đây
    );
  }

  // Hàm phụ để tạo dòng gợi ý
  Widget _buildTrendingItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.trending_up, color: Colors.grey, size: 20),
          SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        ],
      ),
    );
  }
}