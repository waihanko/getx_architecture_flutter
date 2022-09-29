import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class BetterVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const BetterVideoPlayer({
    Key? key,
    required this.videoUrl,
  }) : super(key: key);

  @override
  _BetterVideoPlayerState createState() => _BetterVideoPlayerState();
}

class _BetterVideoPlayerState extends State<BetterVideoPlayer> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      // cacheConfiguration: const BetterPlayerCacheConfiguration(
      //   useCache: true,
      //   preCacheSize: 10 * 1024 * 1024,
      //   maxCacheSize: 10 * 1024 * 1024,
      //   maxCacheFileSize: 10 * 1024 * 1024,
      //
      //   ///Android only option to use cached video between app sessions
      //   key: "testCacheKey",
      // ),
    );

    _betterPlayerController = BetterPlayerController(
      const BetterPlayerConfiguration(
          controlsConfiguration: BetterPlayerControlsConfiguration(
              enableFullscreen: false,
              enableSkips: false,
              enablePlaybackSpeed: false,
              enableMute: false,
              enableOverflowMenu: false,
              enableSubtitles: false,
              enablePlayPause: false,
              enableProgressText: false,
              playIcon: Icons.play_arrow_rounded,
              pauseIcon: Icons.pause_rounded,
              enableProgressBar: false,
              controlBarColor: Colors.black38),
          autoPlay: true,
          looping: true,
          allowedScreenSleep: false,
          autoDetectFullscreenDeviceOrientation: true,
          fit: BoxFit.contain,
          expandToFill: false),
      betterPlayerDataSource: betterPlayerDataSource,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _betterPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent,
          ),
          child: BetterPlayer(
            controller: _betterPlayerController,
          ),
        ),
      ],
    );
  }
}
