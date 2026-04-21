import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  // 🔹 Tambahkan onBack agar bisa dikontrol dari MainPage
  final VoidCallback onBack; 

  const Categories({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    // ❌ Hapus Scaffold & AppBar
    // ✅ Gunakan Column agar menyatu dengan MainPage
    return Column(
      children: [
        // Membuat "AppBar" manual yang ada tombol back-nya
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: onBack, // 🔹 Kembali ke menu grid dashboard
              ),
              const Text(
                "CATEGORIES",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
        
        // Isi konten kategori kamu
        const Expanded(
          child: Center(
            child: Text("Ini Halaman Categories (Tanpa Scaffold)"),
          ),
        ),
      ],
    );
  }
}