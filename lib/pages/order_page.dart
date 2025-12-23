import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Đơn hàng của tôi", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            labelColor: Colors.pink,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.pink,
            tabs: [
              Tab(text: "Đang xử lý"),
              Tab(text: "Đã giao"),
              Tab(text: "Đã hủy"),
            ],
          ),
        ),
        backgroundColor: Colors.grey[100], // Màu nền xám nhạt làm nổi bật card
        body: TabBarView(
          children: [
            _buildOrderList("processing"), // Tab 1
            _buildOrderList("delivered"),  // Tab 2
            _buildOrderList("cancelled"),  // Tab 3
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(String status) {
    final List<Map<String, dynamic>> allOrders = [
      {
        "id": "#FH9321",
        "date": "17/12/2025",
        "status": "processing",
        "total": 45.00,
        "items": 2,
        "image": "assets/images/1iphone12.jpg",
        "productName": "Áo Thun Basic Cotton (x2)"
      },
      {
        "id": "#FH8821",
        "date": "15/11/2025",
        "status": "delivered",
        "total": 120.50,
        "items": 1,
        "image": "assets/images/1iphone12.jpg",
        "productName": "Giày Sneaker Cao Cấp"
      },
      {
        "id": "#FH1023",
        "date": "10/10/2025",
        "status": "cancelled",
        "total": 30.00,
        "items": 1,
        "image": "assets/images/1iphone12.jpg",
        "productName": "Mũ Lưỡi Trai Unisex"
      },
    ];

    // Lọc đơn hàng theo tab hiện tại
    final orders = allOrders.where((o) => o['status'] == status).toList();

    // Nếu không có đơn hàng nào
    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey[300]),
            const SizedBox(height: 10),
            const Text("Chưa có đơn hàng nào", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }

    // Nếu có đơn hàng -> Hiển thị list
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return _buildOrderCard(orders[index]);
      },
    );
  }
  Widget _buildOrderCard(Map<String, dynamic> order) {
    Color statusColor;
    String statusText;

    // Logic màu sắc cho trạng thái
    switch (order['status']) {
      case 'processing':
        statusColor = Colors.orange;
        statusText = "Đang xử lý";
        break;
      case 'delivered':
        statusColor = Colors.green;
        statusText = "Giao thành công";
        break;
      case 'cancelled':
        statusColor = Colors.red;
        statusText = "Đã hủy";
        break;
      default:
        statusColor = Colors.grey;
        statusText = "Không rõ";
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 5, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          // 1. Header: Mã đơn + Trạng thái
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  order['id'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    statusText,
                    style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // 2. Body: Ảnh + Tên sp + Giá
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    order['image'],
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        order['productName'],
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${order['items']} sản phẩm",
                        style: TextStyle(color: Colors.grey[600], fontSize: 13),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Ngày đặt: ${order['date']}",
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // 3. Footer: Tổng tiền + Nút bấm
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Thành tiền:", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    Text(
                      "\$${order['total'].toStringAsFixed(2)}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.pink),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.pink),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                  onPressed: () {
                    // Chức năng xem chi tiết
                  },
                  child: const Text("Chi tiết", style: TextStyle(color: Colors.pink)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}