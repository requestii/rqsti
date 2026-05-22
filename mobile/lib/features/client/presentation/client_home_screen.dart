import 'package:flutter/material.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cards = [
      ('Post a Job', Icons.post_add_outlined),
      ('Browse Workers', Icons.search_outlined),
      ('My Orders', Icons.shopping_bag_outlined),
      ('Wallet', Icons.account_balance_wallet_outlined),
      ('Messages', Icons.chat_bubble_outline),
      ('Track Tasks', Icons.location_on_outlined),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Client Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: cards.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemBuilder: (context, index) {
            final (title, icon) = cards[index];
            return Card(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 34),
                    const SizedBox(height: 10),
                    Text(title, textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
