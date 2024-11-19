import 'package:flutter/material.dart';
import 'package:pas/Database/db_helper.dart';

class DetailPage extends StatelessWidget {

  final animes anime;

  const DetailPage({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.strTeam),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(anime.strBadge),
            const SizedBox(height: 16),
            Text(
              anime.strTeam,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              anime.strLeague,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Tahun: ${anime.strTeam}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red[700],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
