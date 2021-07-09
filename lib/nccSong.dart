import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:nccguide/constants.dart';

class nccSong extends StatefulWidget {
  @override
  _nccSongState createState() => _nccSongState();
}

class _nccSongState extends State<nccSong> {
  static AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    loadSong();
    super.initState();
  }

  @override
  void loadSong() {
    _assetsAudioPlayer.open(
      Audio("audios/NccSong.mp3"),
      autoStart: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF081018),
          leading: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: IconButton(
              icon: Icon(
                Icons.home,
                color: Color(0xFFFFFFFF),
                size: 30.0,
              ),
              onPressed: () {
                _assetsAudioPlayer.isPlaying.value
                    ? _assetsAudioPlayer.stop()
                    : print(_assetsAudioPlayer.isPlaying.value);
                Navigator.pop(context);
              },
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 25.0, top: 20.0),
              child: Text(
                'हम सब भारतीय हैं',
                style: ksimpleTS,
              ),
              ),
          ],
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 15.0),
                  child: Text(
                    'NCC Song',
                    style: kheaderTS,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    'Written By Sudarshan Faakir, Adopted in Oct 1982',
                    style: kheaderTS.copyWith(
                      fontSize: 18.0,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    '''
Hum Sab Bharatiya Hain, Hum Sab Bharatiya Hain

Apni Manzil Ek Hai,
Ha, Ha, Ha, Ek Hai,
Ho, Ho, Ho, Ek Hai.
Hum Sab Bharatiya Hain.

Kashmir Ki Dharti Rani Hai,
Sartaj Himalaya Hai,
Saadiyon Se Humne Isko Apne Khoon Se Pala Hai
Desh Ki Raksha Ki Khatir Hum Shamshir Utha Lenge,
Hum Shamshir Utha Lenge.

Bikhre Bikhre Taare Hain Hum Lekin Jhilmil Ek Hai,
Ha, Ha, Ha, Ek Hai
Hum Sab Bharatiya Hai.

Mandir Gurudwaare Bhi Hain Yahan
Aur Masjid Bhi Hai Yahan
Girija Ka Hai Ghariyaal Kahin
Mullah ki Kahin Hai Ajaan

Ek Hee Apna Ram Hain, Ek hi Allah Taala Hai,
Ek Hee Allah Taala Hain, Raang Birange Deepak Hain Hum,
lekin Jagmag Ek Hai, Ha Ha Ha Ek Hai, Ho Ho Ho Ek Hai.

Hum Sab Bharatiya Hain, Hum Sab Bharatiya Hain.
                    ''',
                    style: ksimpleTS.copyWith(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.pause,
                  size: 50.0,
                  color: Color(0xFFEF1C25),
                ),
                onPressed: () {
                  _assetsAudioPlayer.pause();
                },
              ),
              SizedBox(width: 30.0),
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  size: 50.0,
                  color: Color(0xFF2D3092),
                ),
                onPressed: () {
                  _assetsAudioPlayer.play();
                },
              ),
              SizedBox(width: 30.0),
              IconButton(
                icon: Icon(
                  Icons.stop,
                  size: 50.0,
                  color: Color(0xFF00AEEF),
                ),
                onPressed: () {
                  _assetsAudioPlayer.stop();
                  loadSong();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
