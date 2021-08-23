import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  Offset? _initialSwipeOffset;
  Offset? _finalSwipeOffset;
  final _mp4List = ["asserts/mp4/1.mp4", "asserts/mp4/2.mp4"];
  static const _webVideoUrl =
      "https://flutter-in-action.oss-cn-hangzhou.aliyuncs.com/3.mp4";
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(_webVideoUrl);
    _controller.setLooping(true);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.play();
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
    });
  }

  void changeMp4() async {
    if (_initialSwipeOffset != null && _finalSwipeOffset != null) {
      final offsetDifference = _initialSwipeOffset!.dy - _finalSwipeOffset!.dy;
      offsetDifference > 0 ? _currentIndex++ : _currentIndex--;
    }
    await _controller.pause();
    _controller = VideoPlayerController.asset(_mp4List[_currentIndex % 2]);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.setLooping(true);
      _controller.play();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("视频播放"),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              child: Stack(
                children: [
                  Center(
                    child: VideoPlayer(_controller),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "上下滑动切换",
                      style: TextStyle(color: Colors.white,fontSize: 17),
                    ),
                  ),
                ],
              ),
              onDoubleTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              onVerticalDragStart: (start) {
                _initialSwipeOffset = start.globalPosition;
              },
              onVerticalDragUpdate: (update) {
                _finalSwipeOffset = update.globalPosition;
              },
              onVerticalDragEnd: (end) {
                changeMp4();
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
