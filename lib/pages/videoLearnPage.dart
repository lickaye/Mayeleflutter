
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_viewer/domain/bloc/controller.dart';
import 'package:video_viewer/video_viewer.dart';



class videoLearnPage extends StatefulWidget {
  const videoLearnPage({Key? key}) : super(key: key);

  @override
  _videoLearnPageState createState() => _videoLearnPageState();
}

class _videoLearnPageState extends State<videoLearnPage> {

  final VideoViewerController controller = VideoViewerController();



  @override
  Widget build(BuildContext context) {

    var data;


    data = ModalRoute.of(context)!.settings.arguments;
    var video = data['video'];
    var picture = data['picture'];
    var description = data['description'];
    var titre = data['titre'];

  print(video);


    return Scaffold(



      body:  Column(
        children: [
          VideoViewer(
            controller: controller,
            //autoPlay: false,
            source: {
              "SubRip Text": VideoSource(
                video: VideoPlayerController.network("$video"
                ),
              ),

            },
            style: VideoViewerStyle(
              thumbnail: Image.asset(
                  'images/videospicture.jpg',
                  width: double.infinity,
                  height: 150,
                  fit:BoxFit.fill
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                child: Text(
                  titre.toUpperCase(),style: TextStyle(fontSize: 18.0,color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                child: Text(
                  description,style: TextStyle(fontSize: 17.0,color: Colors.grey
                ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }

  //VideoPlayerController getVideoPlayer() => controller.controller;
  String? getactiveSourceNameName() => controller.activeSourceName;
  String? getActiveCaption() => controller.activeCaption;
  bool isFullScreen() => controller.isFullScreen;
  bool isBuffering() => controller.isBuffering;
  bool isPlaying() => controller.isPlaying;
/*
  Container(

  child: Text(titre,style: TextStyle(fontSize: 17.0,color: Colors.white),),
  ),
  Container(

  child: Text(description,style: TextStyle(fontSize: 17.0,color: Colors.white),),
  )*/
}
