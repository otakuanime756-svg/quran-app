import 'package:flutter/material.dart';
import '../../../core/routing/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('القرآن الكريم')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          const Text('بسم الله الرحمن الرحيم',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 28),
          Card(
            child: ListTile(
              leading: const Icon(Icons.menu_book_outlined, size: 34),
              title: const Text('متابعة القراءة',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: const Text('فتح المصحف'),
              onTap: () => Navigator.pushNamed(context, AppRouter.mushaf),
            ),
          ),
          const SizedBox(height: 12),
          Card(child: ListTile(
            leading: const Icon(Icons.headphones_outlined),
            title: const Text('الاستماع'),
            onTap: () {},
          )),
          Card(child: ListTile(
            leading: const Icon(Icons.search),
            title: const Text('البحث'),
            onTap: () {},
          )),
          Card(child: ListTile(
            leading: const Icon(Icons.bookmark_outline),
            title: const Text('العلامات'),
            onTap: () {},
          )),
        ],
      ),
    );
  }
}
