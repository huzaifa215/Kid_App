
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'Chewei_List_item.dart';
import 'package:firebase_admob/firebase_admob.dart';


const String testdevice='';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  static final MobileAdTargetingInfo targetInfo=new MobileAdTargetingInfo(
    testDevices: testdevice !=null?<String>[testdevice]:null,
    keywords: <String>['videos','kids'],
    birthday: new DateTime.now(),
    childDirected: true
   );

BannerAd _bannerAd;
  BannerAd createBannerAd(){
    return new BannerAd(adUnitId: BannerAd.testAdUnitId, size: AdSize.banner,targetingInfo: targetInfo,
        listener: (MobileAdEvent event){
          print('Banner Event :$event');
        });
  }
 // FirebaseAdMob.instance.initializ(appId:FirebaseAdMob.testAppId);

  @override
 void initsate(){
    FirebaseAdMob.instance.initialize(appId:FirebaseAdMob.testAppId);
    _bannerAd=createBannerAd()..load()  ..show();
  }
  void dispose(){
    _bannerAd?.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/123.mp4',
            ),
            looping: true,
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.asset(
              'videos/123.mp4',
            ),
          ),
          ChewieListItem(
            // This URL doesn't exist - will display an error
            videoPlayerController: VideoPlayerController.asset(
              'videos/123.mp4',
            ),
          ),
        ],
      ),
    );
  }
}