import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title) {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // 🔹 MAIN CARD
        buildMainCard("TOTAL ITEMS", "0"),

        const SizedBox(height: 16),

        // 🔹 SMALL CARDS
        Row(
          children: [
            buildSmallCard("STOCK IN", "assets/images/Stock-in.png"),
            const SizedBox(width: 10),
            buildSmallCard("STOCK OUT", "assets/images/Stock-out.png"),
          ],
        ),

        const SizedBox(height: 20),

        // 🔹 MENU TITLE
        const Text(
          "Menu",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        // 🔹 GRID MENU
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            buildMenuItem(Icons.inventory, "ITEMS"),
            buildMenuItem(Icons.category, "CATEGORIES"),
            buildMenuItem(Icons.history, "HISTORY"),
            buildMenuItem(Icons.people, "USERS"),
          ],
        ),
      ],
    );
  }
}