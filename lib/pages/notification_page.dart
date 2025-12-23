import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thông báo',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
      ),
      body: ListView.builder(
        itemCount: 10, // Ví dụ 10 thông báo
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink[100],
              child: Icon(Icons.notifications, color: Colors.pink),
            ),
            title: Text('Thông báo số ${index + 1}'),
            subtitle: Text('Nội dung chi tiết của thông báo khuyến mãi...'),
            trailing: Text('2 giờ trước', style: TextStyle(fontSize: 12, color: Colors.grey)),
            onTap: () {
              // Xử lý khi bấm vào 1 thông báo
            },
          );
        },
      ),
    );
  }
}