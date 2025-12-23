import 'package:flutter/material.dart';
import 'package:project1/pages/favotire_page.dart';
import 'package:project1/pages/login_page.dart';
import 'package:project1/pages/order_page.dart';
import 'package:project1/pages/register_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isLoggedIn = true; 

  final String _userName = "Nguyễn Văn A";
  final String _userEmail = "nguyenvana@gmail.com";

  // Hàm đăng xuất
  void _logout() {
    setState(() {
      _isLoggedIn = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      // Logic: Nếu đã login -> Hiện Profile, chưa -> Hiện nút Đăng nhập/Đăng ký
      body: _isLoggedIn ? _buildLoggedInView() : _buildGuestView(),
    );
  }
  Widget _buildLoggedInView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header: Avatar + Tên + Email
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
              ],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink[100],
                      // Bạn có thể thay bằng NetworkImage nếu có link ảnh online
                      backgroundImage: const AssetImage('assets/images/1iphone12.jpg'), 
                      child: const Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
                        child: const Icon(Icons.edit, color: Colors.white, size: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Text(
                  _userName,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                const SizedBox(height: 5),
                Text(
                  _userEmail,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Menu chức năng
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildMenuCard(
                  title: "Đơn hàng của tôi",
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderPage()));
                  },
                ),
                const SizedBox(height: 15),
                _buildMenuCard(
                  title: "Sản phẩm yêu thích",
                  icon: Icons.favorite_border,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoritePage()));
                  },
                ),
                const SizedBox(height: 15),
                _buildMenuCard(
                  title: "Địa chỉ nhận hàng",
                  icon: Icons.location_on_outlined,
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                _buildMenuCard(
                  title: "Cài đặt tài khoản",
                  icon: Icons.settings_outlined,
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Nút Đăng xuất
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.white,
                ),
                onPressed: _logout, // Gọi hàm logout để quay về màn hình Login
                icon: const Icon(Icons.logout, color: Colors.red),
                label: const Text("Đăng xuất", style: TextStyle(color: Colors.red, fontSize: 16)),
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  // Widget phụ để vẽ từng dòng menu cho đẹp
  Widget _buildMenuCard({required String title, required IconData icon, required VoidCallback onTap}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.pink[50], shape: BoxShape.circle),
          child: Icon(icon, color: Colors.pink),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildGuestView() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle_outlined, size: 100, color: Colors.grey[300]),
          const SizedBox(height: 20),
          const Text(
            'Bạn chưa đăng nhập',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Vui lòng đăng nhập để xem thông tin cá nhân và đơn hàng của bạn.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 40),

          // Nút LOGIN (Giả lập)
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
              },
              child: const Text('Đăng nhập', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.pink),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>RegisterPage()));
              },
              child: const Text('Đăng ký', style: TextStyle(color: Colors.pink, fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}