import 'package:flutter/material.dart';
import 'package:project1/pages/cart_page.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/pages/notification_page.dart';
import 'package:project1/pages/profile_page.dart';
import 'package:project1/pages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() =>_MainPageState ();
}

class _MainPageState extends State<MainPage> {
  int _selectedPage = 0;
  final List<Widget> pages=[
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedPage=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_selectedPage==3)? null:AppBar(
        title: Text('FASHION HUB',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationPage()),
              );
            }, 
            icon: Icon(Icons.notifications),
          )
        ],
      ),
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pink[300],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedPage,
        onTap: _onItemTapped,
        items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile'
                ),
              ],
              type: BottomNavigationBarType.fixed,
            ),
    );
  }
}