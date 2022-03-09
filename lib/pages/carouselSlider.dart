import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class carouselSlider extends StatefulWidget {
  const carouselSlider({Key? key}) : super(key: key);

  @override
  _carouselSliderState createState() => _carouselSliderState();
}

class _carouselSliderState extends State<carouselSlider> {
  List contenu = [];
  bool isLoadibg = false;

  fetchContenu() async {
    String url = 'http://app.mobile.cg-mayele.com/json/slider/show';

    var response = await http.get(Uri.parse(url));

    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['Slider'];

      setState(() {
        contenu = items;
        isLoadibg = true;
      });

      /*Map<String, dynamic> user = jsonDecode(slider);

      print('Howdy, ${user['img_url']}!');
      print('We sent the verification link to ${user['video_url']}.');

      print(items['img_url']);*/
    } else {
      /*setState(() {
        contenu = [];
      });*/
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    this.fetchContenu();
  }

  @override
  Widget build(BuildContext context) {

    print(contenu);
    Widget child;

    if (isLoadibg == false) {
      child = Container(
          width: double.infinity,
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black,
          ),
          child: Center(child: CircularProgressIndicator()));
    } else {
      child = Container(
          color: Colors.black,
          child: CarouselSlider.builder(
            itemCount: contenu.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/carouseldetail', arguments: {
                          'video': contenu[index]['video_url'],
                          'titre': contenu[index]['titre'],
                          'descriprion': contenu[index]['descriprion'],

                    });


                  },
                  child: Center(
                    child: CachedNetworkImage(
                      imageUrl:
                      'http://app.mobile.cg-mayele.com/uploads/file/contenu/${contenu[index]['img_url']}',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => SizedBox(
                        child: Center(child: CircularProgressIndicator()),
                        height: 50.0,
                        width: 50.0,
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      cacheKey:
                      'http://app.mobile.cg-mayele.com/uploads/file/contenu/${contenu[index]['img_url']}',
                    ),
                  ),
                ),
              );
            },
          ));
    }

    return new Container(child: child);
  }
}
