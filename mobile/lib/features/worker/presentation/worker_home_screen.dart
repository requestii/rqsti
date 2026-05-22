import 'package:flutter/material.dart';

class WorkerHomeScreen extends StatelessWidget {
  const WorkerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Available Jobs', Icons.work_outline),
      ('My Proposals', Icons.description_outlined),
      ('Active Contracts', Icons.assignment_turned_in_outlined),
      ('Earnings', Icons.payments_outlined),
      ('Portfolio', Icons.photo_library_outlined),
      ('Messages', Icons.chat_outlined),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Worker Dashboard')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final (label, icon) = items[index];
          return Card(
            child: ListTile(
              leading: Icon(icon),
              title: Text(label),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
