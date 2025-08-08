import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/chant.dart';
import 'chant_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Chant> _chants = [];
  List<Chant> _filtered = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadChants();
  }

  Future<void> _loadChants() async {
    final data = await rootBundle.loadString('assets/data/chants.json');
    final List<dynamic> jsonList = json.decode(data);
    final chants = jsonList.map((e) => Chant.fromJson(e as Map<String, dynamic>)).toList();
    setState(() {
      _chants = chants;
      _filtered = chants;
    });
  }

  void _onSearch(String query) {
    setState(() {
      _filtered = _chants.where((c) => c.title.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaMu – บทสวดมนต์'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: _controller,
              onChanged: _onSearch,
              decoration: const InputDecoration(
                hintText: 'ค้นหาบทสวด...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const Center(child: Text('ยังไม่มีบทสวด หรือกำลังโหลด...'))
                : ListView.separated(
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final chant = _filtered[index];
                      return ListTile(
                        title: Text(chant.title),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => ChantScreen(chant: chant)),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
