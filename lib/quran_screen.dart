import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import 'package:quran_project/cash_helper.dart';
import 'package:quran_project/controller.dart';

class QuranScreen extends StatefulWidget {
  final Map<String, String> data;
  final String readeName;
  const QuranScreen({Key? key, required this.data, required this.readeName})
      : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ListView.builder(
            addAutomaticKeepAlives: true,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.data.keys.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 375),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: QuranWidget(
                        name: widget.data.keys.toList()[index],
                        url: widget.data.values.toList()[index],
                        readerName: widget.readeName,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class QuranWidget extends StatefulWidget {
  QuranWidget(
      {super.key,
      required this.url,
      required this.name,
      required this.readerName});
  final String name;
  final String readerName;
  final String url;
  bool isPlay = false;

  AudioPlayer audioPlayer = AudioPlayer();
  Duration progress = Duration.zero;

  bool inDownload = false;
  double valueOfLinearProgress = 0.0;

  int receivedData = 0;
  int totalData = 0;

  @override
  State<QuranWidget> createState() => _QuranWidgetState();
}

class _QuranWidgetState extends State<QuranWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Controller.checkIsDownloaded(url: widget.url)
        ? buildIfAudioIsDownloaded()
        : buildIfIsNotDownloaded();
  }
@override
  void dispose() {
  widget.audioPlayer.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();

    if (Controller.checkIsDownloaded(url: widget.url)) {
      String path = CashHelper.getData(key: widget.url);
      widget.audioPlayer.setUrl(path);
      widget.audioPlayer.positionStream.listen((event) {
        setState(() {
          widget.progress = event;

          if (widget.audioPlayer.duration == event) {
            widget.audioPlayer.seek(Duration.zero);
            widget.audioPlayer.pause();
            widget.isPlay = false;
          }
        });
      });
    }
  }

  Widget buildIfAudioIsDownloaded() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              if (!widget.isPlay) playIcon(path: widget.url),
              if (widget.isPlay) pauseIcon(),
            ],
          ),
          ProgressBar(
            progress: widget.progress,
            buffered: widget.audioPlayer.bufferedPosition,
            total: widget.audioPlayer.duration ?? Duration.zero,
            onSeek: (duration) {
              widget.audioPlayer.seek(duration);
            },
          )
        ],
      ),
    );
  }

  Widget buildIfIsNotDownloaded() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.name,
                  style: const TextStyle(fontSize: 30.0),
                ),
              ),
              widget.inDownload
                  ? Row(
                      children: [
                        Text(
                            '${widget.receivedData}KB / ${widget.totalData}KB'),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator()),
                      ],
                    )
                  : IconButton(
                      onPressed: _downloadItem,
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
          if (widget.inDownload)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: LinearProgressIndicator(
                value: widget.valueOfLinearProgress,
              ),
            ),
        ],
      ),
    );
  }

  Widget pauseIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          // audioController.pause();
          widget.isPlay = false;

          // widget.isStopped=true;
          widget.audioPlayer.pause();
        });
      },
      icon: const Icon(
        Icons.pause,
        color: Colors.black,
      ),
    );
  }

  Widget playIcon({required String path}) {
    return IconButton(
      onPressed: () {
        setState(() {
          widget.isPlay = true;
          widget.audioPlayer.play();
        });
      },
      icon: const Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
    );
  }

  void _downloadItem() async {
    setState(() {
      widget.inDownload = !widget.inDownload;
    });

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String downloadPath =
        '$appDocPath/quran/${widget.readerName}${widget.name}.mp3';
    Dio().download(widget.url, downloadPath,
        onReceiveProgress: (received, total) {
      double percentage = (received / total);

      setState(() {
        widget.valueOfLinearProgress = percentage;
        widget.receivedData = (received / 1024).round();
        widget.totalData = (total / 1024).round();
      });
    }).then((value) async {
      await CashHelper.setData(key: widget.url, value: downloadPath);

      setState(() {
        widget.inDownload = !widget.inDownload;
      });
      widget.audioPlayer.setUrl(widget.url);
      widget.audioPlayer.positionStream.listen((event) {
        setState(() {
          widget.progress = event;
        });
      });
    });
  }
}
