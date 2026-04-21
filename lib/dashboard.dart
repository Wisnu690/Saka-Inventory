import 'package:flutter/material.dart';
import 'package:saka_inventory/categories.dart';
import 'package:saka_inventory/users.dart'; // 🔹 Pastikan ini sesuai dengan nama filemu

class Dashboard extends StatefulWidget {
  final VoidCallback onNavigateToItems; 

  const Dashboard({super.key, required this.onNavigateToItems});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // 🔥 PENGONTROL PINDAH HALAMAN
  String activeSubPage = "main"; 

  // 🔹 HALAMAN SEMENTARA UNTUK HISTORY & USERS
  Widget _buildSubPage(String title) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () {
                  setState(() {
                    activeSubPage = "main";
                  });
                },
              ),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text("Isi dari halaman $title akan ditaruh di sini", 
            style: const TextStyle(color: Colors.grey)),
          ),
        ),
      ],
    );
  }

  Widget buildMainCard(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 10),
          Center(
            child: Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallCard(String title, String imagePath) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Image.asset(
              imagePath,
              width: 30,
              height: 30,
              color: Colors.white,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  // 🔥 PERUBAHAN ADA DI SINI: Kita ganti InkWell pakai GestureDetector biar 100% responsif
  Widget buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30),
            const SizedBox(height: 5),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    // 🔥 CEK STATUS SAAT INI (Biar kelihatan di terminal kalau halamannya berubah)
    print("🔥 Status Halaman Saat Ini: $activeSubPage");

    // LOGIKA PENUKAR HALAMAN
    if (activeSubPage == "categories") {
      return Categories(onBack: () => setState(() => activeSubPage = "main"));
    } else if (activeSubPage == "history") {
      return _buildSubPage("HISTORY");
    } else if (activeSubPage == "users") {
      return Users(onBack: () => setState(() => activeSubPage = "main"));
    }

    // Default: Tampilkan Layar Dashboard Utama
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        buildMainCard("TOTAL ITEMS", "0"),
        const SizedBox(height: 16),
        Row(
          children: [
            buildSmallCard("STOCK IN", "assets/images/Stock-in.png"),
            const SizedBox(width: 10),
            buildSmallCard("STOCK OUT", "assets/images/Stock-out.png"),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Menu", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildMenuItem(Icons.inventory, "ITEMS", widget.onNavigateToItems),
            buildMenuItem(Icons.category, "CATEGORIES", () {
              setState(() => activeSubPage = "categories");
            }),
            buildMenuItem(Icons.history, "HISTORY", () => setState(() => activeSubPage = "history")),
            buildMenuItem(Icons.people, "USERS", () => setState(() => activeSubPage = "users")),
          ],
        ),
      ],
    );
  }
}