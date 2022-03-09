import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:mayele/pages/AllSliderShowdetail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class DetailCarouselVideo extends StatefulWidget {
  const DetailCarouselVideo({Key? key}) : super(key: key);

  @override
  _DetailCarouselVideoState createState() => _DetailCarouselVideoState();
}

class _DetailCarouselVideoState extends State<DetailCarouselVideo> {
  @override
  Widget build(BuildContext context) {

    var data;
    data = ModalRoute.of(context)!.settings.arguments;

    var titre = data['titre'];
    var description = data['descriprion'];
    var videoId = YoutubePlayer.convertUrlToId(data['video']);
    print(videoId);

    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: '$videoId', // id youtube video
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          YoutubePlayer(
                            controller: _controller,
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text(
                                  titre.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                      fontFamily: 'Raleway'),
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
                                child: ExpandableTheme(
                                  data: const ExpandableThemeData(
                                    iconColor: Colors.blue,
                                    useInkWell: true,
                                  ),
                                  child: ExpandablePanel(
                                    header: Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.grey,
                                          fontFamily: 'Raleway'),
                                      textAlign: TextAlign.left,
                                    ),
                                    collapsed: Text(description,
                                        softWrap: true,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.grey,
                                            fontFamily: 'Raleway')),
                                    expanded: Text(description,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.grey,
                                            fontFamily: 'Raleway')),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: double.infinity,
              height: 250,
              child: AllSliderShowDetail(),
            ),
          ],
        ),
      ),
    );
  }
}
