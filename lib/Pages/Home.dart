import 'package:flutter/material.dart';
import 'package:pas/MenuNav/Favorite.dart';
import 'package:pas/MenuNav/Menu.dart';
import 'package:pas/MenuNav/Menu2.dart';
import 'package:pas/MenuNav/Profile.dart';
import 'package:pas/Widget/bnb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();

  // List widget untuk setiap menu
  final List<Widget> _menu = [
    const Profile(),
    const FavoritePage(),
     AnimeView(),
    const Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // PageView untuk menampilkan halaman-halaman berdasarkan index
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                // Update bottom navigation jika page berubah
              },
              children: _menu,
            ),
            // Menampilkan AppBBN (Bottom Navigation) di posisi bawah
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: AppBBN(
                atBottom: true,
                pageController: _pageController, // Pass controller ke AppBBN
              ),
            ),
          ],
        ),
      ),
    );
  }
}
