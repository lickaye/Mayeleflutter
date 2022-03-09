import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
    Widget child;

    if (isLoadibg == false) {
      child = Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.black,
          ),
          child: Center(child: CircularProgressIndicator()));
    } else {
      child = Container(
        height: 150,
        child: Scaffold(
          appBar: AppBar(title: Text('Prefetch image slider demo')),
          body: Container(
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
                    Navigator.pushNamed(context, '/carouselpage',
                        arguments: {print(contenu[index]['titre'])});

                    // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> videoLearnPage(contenuModel: contenu[index])));
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
          )),
        ),
      );
    }

    return new Container(child: child);
  }


}
