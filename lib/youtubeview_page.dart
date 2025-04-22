import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeviewPage extends StatefulWidget {
  final String url;

  const YoutubeviewPage({super.key, required this.url});

  @override
  State<YoutubeviewPage> createState() => _YoutubeviewPageState();
}

class _YoutubeviewPageState extends State<YoutubeviewPage> {
  late final YoutubePlayerController _youtubePlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String youtubeVideoId = YoutubePlayer.convertUrlToId(widget.url)!;
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: youtubeVideoId,
      flags: YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        aspectRatio: 16/36,
        showVideoProgressIndicator: true,
        controller: _youtubePlayerController,
        bottomActions: [CurrentPosition(), ProgressBar(isExpanded: true)],
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.amber,
          handleColor: Colors.amberAccent,
        ),

        onReady: () {},
      ),
    );
  }
}
