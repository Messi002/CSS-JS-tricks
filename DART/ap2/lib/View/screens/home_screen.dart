import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home, size:30),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size:30),label: 'Search'),
          BottomNavigationBarItem(icon: CustomIcon(),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message, size:30),label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.person, size:30),label: 'Profile'),
        ]
        ),
      body: Center(child: Text('welcome'),),
    );
  }
}