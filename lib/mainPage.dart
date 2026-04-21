import 'package:flutter/material.dart';
import 'package:saka_inventory/dashboard.dart';
import 'package:saka_inventory/scanner.dart';
import 'package:saka_inventory/items.dart';
import 'package:saka_inventory/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  
  // 🔹 Trik agar dashboard bisa reset ke menu kotak-kotak saat ikon bawah diklik ulang
  Key dashboardKey = UniqueKey(); 

  // 🔹 FUNCTION NAVIGASI PROFILE
  void goToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 🔥 DAFTAR PAGES SEKARANG ADA DI DALAM SINI
    // Sehingga kita bisa mempassing aksi "pindah ke tab Items" ke dalam Dashboard
    final List<Widget> pages = [
      Dashboard(
        key: dashboardKey,
        onNavigateToItems: () {
          setState(() {
            currentIndex = 2; // 🔹 Ini yang akan dipanggil saat kotak ITEMS diklik
          });
        },
      ),
      const Scanner(),
      const Items(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      // 🔥 HEADER CUSTOM
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 🔹 KIRI (LOGO + TEXT)
                Row(
                  // 🔹 Kata 'const' sudah dihapus di sini agar TIDAK ERROR saat pakai errorBuilder
                  children: [
                    Image(
                      image: const AssetImage('assets/images/Logo.png'),
                      width: 50,
                      height: 50,
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.inventory_2),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "INVENTORY",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),

                // 🔹 KANAN (PROFILE CLICKABLE)
                IconButton(
                  onPressed: goToProfile,
                  icon: const Icon(Icons.person_outline, size: 28),
                ),
              ],
            ),
          ),
        ),
      ),

      // 🔥 BODY
      body: pages[currentIndex],

      // 🔥 FLOATING BUTTON (SCAN)
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          },
          backgroundColor: Colors.black,
          shape: const CircleBorder(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.qr_code_scanner, color: Colors.white),
              Text(
                "SCAN",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
        ),
      ),

      // 🔥 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFD9D9D9),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            // 🔹 Reset isi tab Dashboard jika user menekan ikon Dashboard lagi
            if (index == 0 && currentIndex == 0) {
              dashboardKey = UniqueKey();
            }
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'DASHBOARD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.compare_arrows_rounded),
            label: 'ITEMS',
          ),
        ],
      ),
    );
  }
}