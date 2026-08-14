import 'package:flutter/material.dart';

import '../../../core/routing/app_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القرآن الكريم'),
        actions: [
          IconButton(
            tooltip: 'الإعدادات',
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 12),
            Text(
              'بسم الله الرحمن الرحيم',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 28),
            Card(
              elevation: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => Navigator.pushNamed(context, AppRouter.mushaf),
                child: const Padding(
                  padding: EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.menu_book_outlined, size: 36),
                      SizedBox(height: 16),
                      Text(
                        'متابعة القراءة',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('سنحفظ موضع قراءتك تلقائيًا هنا.'),
                      SizedBox(height: 14),
                      Text('فتح المصحف ←'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _QuickAction(
                  icon: Icons.headphones_outlined,
                  title: 'الاستماع',
                  onTap: () {},
                )),
                const SizedBox(width: 12),
                Expanded(child: _QuickAction(
                  icon: Icons.search,
                  title: 'البحث',
                  onTap: () {},
                )),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _QuickAction(
                  icon: Icons.bookmark_outline,
                  title: 'العلامات',
                  onTap: () {},
                )),
                const SizedBox(width: 12),
                Expanded(child: _QuickAction(
                  icon: Icons.history,
                  title: 'آخر قراءة',
                  onTap: () {},
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Icon(icon, size: 30),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
