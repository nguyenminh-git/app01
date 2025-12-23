import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // Nút back màu đen
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'TẠO TÀI KHOẢN',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.pink),
              ),
              const SizedBox(height: 10),
              Text(
                'Tham gia cộng đồng thời trang ngay!',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 40),

              // 1. Họ và tên
              TextField(
                decoration: InputDecoration(
                  hintText: 'Họ và tên',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 2. Email
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 3. Mật khẩu
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // 4. Nhập lại Mật khẩu
              TextField(
                obscureText: true, // Luôn ẩn
                decoration: InputDecoration(
                  hintText: 'Nhập lại mật khẩu',
                  prefixIcon: const Icon(Icons.lock_reset),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 5. Nút Đăng Ký
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                     // Xử lý đăng ký xong thì quay lại login hoặc vào main
                     Navigator.pop(context); 
                  },
                  child: const Text('Đăng ký', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // 6. Quay lại đăng nhập
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Đã có tài khoản? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Quay lại trang Login
                    },
                    child: const Text(
                      'Đăng nhập ngay',
                      style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}