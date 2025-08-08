import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../models/chant.dart';

class ChantScreen extends StatefulWidget {
  final Chant chant;
  const ChantScreen({super.key, required this.chant});

  @override
  State<ChantScreen> createState() => _ChantScreenState();
}

class _ChantScreenState extends State<ChantScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;

  Future<void> _togglePlay() async {
    try {
      if (_isPlaying) {
        await _player.stop();
        setState(() => _isPlaying = false);
      } else {
        // audioPath expects a path like: assets/audio/file.mp3
        final src = UrlSource(""); // placeholder to avoid analyzer warning
        // Use AssetSource with relative path under assets/ declared in pubspec.
        await _player.play(AssetSource(widget.chant.audioPath.replaceFirst('assets/', '')));
        setState(() => _isPlaying = true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('ไม่พบไฟล์เสียงหรือเล่นไม่ได้: ${widget.chant.audioPath}')),
        );
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.chant.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  widget.chant.content,
                  style: const TextStyle(height: 1.6),
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _togglePlay,
                icon: Icon(_isPlaying ? Icons.stop : Icons.play_arrow),
                label: Text(_isPlaying ? 'หยุดเสียง' : 'ฟังเสียง'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
