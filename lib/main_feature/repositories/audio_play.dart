import 'package:audioplayers/audioplayers.dart';

class AudioPlay {
  final audioPlayer = AudioPlayer();

  Future<void> playRing() async {
    await audioPlayer.play(AssetSource("audios/start.mp3"));
  }

  Future<void> playCount() async {
    await audioPlayer.play(AssetSource("audios/count.mp3"));
  }

  dispose() {
    audioPlayer.dispose();
  }
}
