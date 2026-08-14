import 'package:flutter/material.dart';

class MushafPage extends StatelessWidget {
  const MushafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('سورة البقرة', style: TextStyle(fontSize: 17)),
            Text('الجزء ١ • الصفحة ٢', style: TextStyle(fontSize: 11)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'علامة مرجعية',
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: 604,
        itemBuilder: (context, index) {
          return GestureDetector(
            onLongPress: () => _showVerseActions(context),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Card(
                elevation: 1,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                  ),
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 28,
                  ),
                  child: const Center(
                    child: Text(
                      'مصحف القرآن الكريم\n\n'
                      'سيتم هنا وضع صفحات المصحف المعتمدة بعد إدخال '
                      'مصدر النص والصفحات والتحقق منها.\n\n'
                      'هذه الشاشة هي الهيكل الأولي فقط، ولن نضع نصًا '
                      'قرآنيًا تجريبيًا داخل التطبيق.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        height: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const _ReaderBar(),
    );
  }

  void _showVerseActions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            child: Wrap(
              runSpacing: 8,
              children: [
                const ListTile(
                  leading: Icon(Icons.translate),
                  title: Text('الترجمة'),
                ),
                const ListTile(
                  leading: Icon(Icons.menu_book_outlined),
                  title: Text('التفسير'),
                ),
                const ListTile(
                  leading: Icon(Icons.headphones_outlined),
                  title: Text('الاستماع'),
                ),
                const ListTile(
                  leading: Icon(Icons.bookmark_add_outlined),
                  title: Text('حفظ الآية'),
                ),
                const ListTile(
                  leading: Icon(Icons.copy_outlined),
                  title: Text('نسخ'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ReaderBar extends StatelessWidget {
  const _ReaderBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 4, 18, 10),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_left),
            ),
            const Expanded(
              child: Text(
                'صفحة 2 من 604',
                textAlign: TextAlign.center,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
