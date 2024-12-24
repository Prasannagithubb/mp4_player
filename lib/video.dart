// import 'package:flutter/material.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late final Player _player;
//   late final VideoController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _player = Player();
//     _controller = VideoController(_player);
//     // Load the initial video from assets using the 'asset:///' format
//     _player.open(Media('asset:///lib/assets/nature3.mp4'));
//   }

//   void _switchVideo(String videoPath) {
//     // Load the selected video from assets using the 'asset:///' format
//     _player.open(Media('asset:///$videoPath'));
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Video Player')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Video player widget
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width * 9.0 / 16.0,
//               child: Video(controller: _controller),
//             ),
//             const SizedBox(height: 20),
//             // Buttons to switch between videos
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _switchVideo('lib/assets/nature.mp4'),
//                   child: const Text('Nature Video 1'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _switchVideo('lib/assets/nature3.mp4'),
//                   child: const Text('Nature Video 2'),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _switchVideo('lib/assets/nature4.mp4'),
//                   child: const Text('Nature Video 3'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
