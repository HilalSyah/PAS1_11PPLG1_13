import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas/Controllers/GetController.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final postController =
      Get.put(Postcontroller()); // Inisialisasi controller Post

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        // Mengecek status loading dari controller
        if (postController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Menampilkan GridView setelah data selesai dimuat
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.6, // Rasio aspek diperbesar
          ),
          itemCount: postController.postlist.length,
          itemBuilder: (context, index) {
            final post = postController.postlist[index];
            return Card(
              elevation: 8,
              shadowColor: Colors.black.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade100, Colors.white],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Menggunakan Expanded untuk memastikan gambar mengisi ruang
                      Expanded(
                        child: Image.network(
                          post.strBadge,
                          fit: BoxFit.cover, // Pastikan gambar mengisi ruang
                          width: 200, // Mengatur lebar gambar
                        ),
                      ),
                      const SizedBox(height: 8), // Jarak antara gambar dan teks
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          post.strTeam,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          post.strLeague,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                          maxLines: 2, // Batasi jumlah baris
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          post.intFormedYear,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.red[700],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10), // Jarak bawah
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
