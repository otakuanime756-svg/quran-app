import 'package:flutter/material.dart';

class MushafPage extends StatelessWidget {
  const MushafPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(children: [
          Text('سورة البقرة', style: TextStyle(fontSize: 17)),
          Text('الجزء ١ • الصفحة ٢', style: TextStyle(fontSize: 11)),
        ]),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border),
          ),
        ],
      ),
      body: PageView.builder(
        itemCount: 604,
        itemBuilder: (context, index) => GestureDetector(
          onLongPress: () => _showVerseActions(context),
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(28),
                child: Text(
                  'صفحة المصحف ${index + 1}\n\n'
                  'سيتم ربط هذه الصفحة بمصدر القرآن المعتمد بعد التحقق من النص والترخيص.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, height: 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showVerseActions(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (_) => const SafeArea(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ListTile(leading: Icon(Icons.translate), title: Text('الترجمة')),
          ListTile(leading: Icon(Icons.menu_book_outlined), title: Text('التفسير')),
          ListTile(leading: Icon(Icons.headphones_outlined), title: Text('الاستماع')),
          ListTile(leading: Icon(Icons.bookmark_add_outlined), title: Text('حفظ الآية')),
          ListTile(leading: Icon(Icons.copy_outlined), title: Text('نسخ')),
        ]),
      ),
    );
  }
}
