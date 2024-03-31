import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child: const Icon(Icons.home),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTapDown: (TapDownDetails details) {
              Navigator.pushNamed(context, '/screenshots');
            },
            child: const Icon(Icons.camera_alt_rounded),
          ),
          label: 'Screenshots',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/recordings');
            },
            child: const Icon(Icons.movie_creation),
          ),
          label: 'Recordings',
        ),
      ],
    );
  }
}