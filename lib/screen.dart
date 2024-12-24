import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final Player _player;
  late final VideoController _controller;
  bool isPlaying = true; // Track play/pause state

  @override
  void initState() {
    super.initState();
    _player = Player();
    _controller = VideoController(_player);
    // Load the initial video from assets using the 'asset:///' format
    _player.open(Media('asset:///lib/assets/nature3.mp4'));
  }

  void _switchVideo(String videoPath) {
    _player.open(Media('asset:///$videoPath'));
    setState(() {
      isPlaying = true; // Reset play state on video switch
    });
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _player.pause();
    } else {
      _player.play();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Video Player')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Video player with rounded corners and shadow
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Video(controller: _controller),
              ),
            ),
            const SizedBox(height: 20),
            // Play/Pause button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: _togglePlayPause,
                  iconSize: 36,
                  tooltip: isPlaying ? 'Pause' : 'Play',
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Buttons to switch between videos
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _switchVideo('lib/assets/nature.mp4'),
                  child: const Text('Nature Video 1'),
                ),
                ElevatedButton(
                  onPressed: () => _switchVideo('lib/assets/nature3.mp4'),
                  child: const Text('Nature Video 2'),
                ),
                ElevatedButton(
                  onPressed: () => _switchVideo('lib/assets/nature4.mp4'),
                  child: const Text('Nature Video 3'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
