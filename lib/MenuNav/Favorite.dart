import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Model/GetModel2.dart';
import '../database/db_helper.dart'; // Import bottom nav

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Future<List<PostModel>> _favoritesFuture;  // Menggunakan PostModel

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    _favoritesFuture = DatabaseHelper.instance.getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Club', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,  // Hilangkan tombol back karena menggunakan bottom nav
      ),
      body: Container(
        color: Colors.white,  // Ganti warna background
        child: FutureBuilder<List<PostModel>>(  // Menggunakan PostModel
          future: _favoritesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No favorite anime found.'));
            }

            final favorites = snapshot.data!;

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final anime = favorites[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    leading: Image.network(  // Menggunakan Image.network karena URL dari API
                      anime.strBadge,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(anime.strTeam),
                    subtitle: Text(anime.strLeague),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        await DatabaseHelper.instance.removeFavorite(anime.strTeam);
                        Get.snackbar(
                          'Deleted', 
                          '${anime.strTeam} removed from favorites',
                          snackPosition: SnackPosition.BOTTOM,
                          duration: const Duration(seconds: 2),
                        );
                        setState(() {
                          _loadFavorites();
                        });
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),  
    );
  }
}
