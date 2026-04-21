import 'package:flutter/material.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TITLE
          const Text(
            "ITEMS",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          /// SEARCH + FILTER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Text(
                  "FILTER",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(width: 12),

                Container(
                  width: 1,
                  height: 24,
                  color: Colors.grey,
                ),

                const SizedBox(width: 12),

                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "SEARCH ITEMS",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const Icon(Icons.search, color: Colors.grey),
              ],
            ),
          ),

          const SizedBox(height: 16),

          /// LIST ITEMS
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ItemCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 COMPONENT CARD ITEM
class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Samsung S26 Ultra",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "SKU-HP-201   Samsung   Handphone",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          /// ICON ARROW
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}