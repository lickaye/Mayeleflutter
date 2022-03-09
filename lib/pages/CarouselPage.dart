import 'dart:convert';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarouselPage extends StatefulWidget {
  // const CarouselPage({Key? key}) : super(key: key);

  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
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

      print(contenu);
    } else {
      /*setState(() {
        contenu = [];
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 200.0,
                decoration: BoxDecoration(color: Colors.grey),
                child: Carousel(
                  dotSize: 4.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.lightGreenAccent,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  dotVerticalPadding: 5.0,
                  dotPosition: DotPosition.bottomRight,
                  images: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contenu.length,
                        itemBuilder: (context, index) {
                          return getCard(context, contenu[index]);
                        }),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/carouselpage',arguments: {

                          });
                        },
                        child: Image.asset('images/slider1.jpg',fit: BoxFit.cover,
                        )),

                    Image.asset('images/slider2.jpg',fit: BoxFit.cover),
                    Image.asset('images/slider3.jpg',fit: BoxFit.cover),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getCard(context, index) {
    var picture = index['img_url'];



    var pictureuri =
        "http://app.mobile.cg-mayele.com/uploads/file/contenu/$picture";
    print(pictureuri);
    return  Carousel(
      dotSize: 4.0,
      dotSpacing: 15.0,
      dotColor: Colors.lightGreenAccent,
      indicatorBgPadding: 5.0,
      dotBgColor: Colors.transparent,
      dotVerticalPadding: 5.0,
      dotPosition: DotPosition.bottomRight,
      images: [

        NetworkImage(pictureuri)
      ],
    );
  }
}
